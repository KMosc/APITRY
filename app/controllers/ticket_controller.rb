class TicketController < ApplicationController
  before_action :set_ticket, only: []

  def index     
    @tickets = Ticket.where(ticket_desk_id: params[:ticket_desk_id]).where(cinema_hall_id: params[:cinema_hall_id])    
    render json: @tickets
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
      if ticket_available?
        if Ticket.exists?(:paid => false)  
          confirm_reservation()
        else
          attributes = ticket_params.clone
          attributes[:paid] = true
          @ticket=Ticket.new(attributes)
          render :json => "Ticket has been bought."
          @ticket.save!

        end
      else
        render :json => "Couldnt buy the ticket, Room is full of people."
      end
  end

  def bookin
    make_reservation()
  end
 


private

    def make_reservation
      if !Ticket.exists?(:paid => false)  
        attributes = ticket_params.clone
        if attributes[:paid] == true
          attributes[:paid] = false
        end
        @ticket=Ticket.new(attributes)
        @ticket.save!
        render :json => "Ticket has been booked."
      end
    end

    def confirm_reservation
      Ticket.where(:paid => false).update_all(paid: true)
      render :json => "You've paid for ticket that You had booked."
    end

    def ticket_available?
      @cinema_hall = CinemaHall.find(params[:cinema_hall_id])
      Ticket.where(cinema_hall_id: params[:cinema_hall_id], paid: true).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume) 
    end

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])      
    end

    def ticket_params
      params.permit(:id, :ticket_desk_id, :cinema_hall_id, :paid)
    end
    
end
