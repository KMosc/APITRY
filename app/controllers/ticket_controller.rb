class TicketController < ApplicationController
  before_action :set_ticket, only: []

  def index     
    if !params[:password].blank?
      @tickets = Ticket.where(password: params[:password]).where(ticket_desk_id: params[:ticket_desk_id]).where(cinema_hall_id: params[:cinema_hall_id])    
      render json: @tickets, except: [:password, :created_at, :updated_at, :ticket_desk_id]
    else
      render json:[]
    end
  end

  def show
    render json:[]
  end
  
  def new
    @ticket = Ticket.new
  end

  def create
    #Cant buy if there is not such ticketdesk or cinemahall
    #Calling multiple methods using .send and []
    if !params[:password].blank?
      if ticket_available?
        if Ticket.exists?(:paid => false)  
          confirm_reservation
        else
          attributes = ticket_params.clone
          attributes[:paid] = false
          @ticket=Ticket.new(attributes)
          render :json => ["log": "ticket.bought"]
          @ticket.save!

        end
      else
        render :json => ["log": "room.full.of.people"]
      end
    else
      render :json => ["log": "password.blank?"]
    end

  end

  def bookin
    make_reservation
  end

private

    def make_reservation
      if !Ticket.exists?(:paid => false)  
        attributes = ticket_params.clone
        if attributes[:paid] == false
          attributes[:paid] = true
        end
        @ticket=Ticket.new(attributes)
        @ticket.save!
        render :json => ["log": "ticket.booked"]
      end
    end

    def confirm_reservation
      Ticket.where(paid: false, password: params[:password]).update_all(paid: true)
      render :json => ["log": "unpaid.ticket.paid"]
    end

    def ticket_available?
      @cinema_hall = CinemaHall.find(params[:cinema_hall_id])
      Ticket.where(params[:movies_id]).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume) 
    end

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])      
    end

    def ticket_params
      params.permit(:id, :password, :ticket_desk_id, :cinema_hall_id, :paid, :movie_id)
    end    
end
