class TicketController < ApplicationController
  before_action :set_ticket, only: []

  def index     

    @tickets = Ticket.where(ticket_desk_id: params[:ticket_desk_id]).where(cinema_hall_id: params[:cinema_hall_id])    
    render json: @tickets
  end

  def show
    render json:[]
  end

  def create
    #Cant buy if there is not such ticketdesk or cinemahall
    #Calling multiple methods using .send and []
      if ticket_available?
        if Ticket.exists?(:paid => false)  
          Ticket.where(:paid => false).update_all(paid: true)
          render :json => "You've paid for ticket that You had booked."
        else
          @ticket=Ticket.new(ticket_params)
          @ticket.paid = true
          render :json => "Ticket has been bought."
          @ticket.save!

        end
      else
        render :json => "Couldnt buy the ticket, Room is full of people."
      end
  end

  def booked
    if ticket_available?
        @ticket = Ticket.create(ticket_params)
        @ticket.paid = false
        render :json => "Ticket has been booked in."
        @ticket.save!
    end
      render :json => "Couldnt bookin the ticket, Room is full of people."
  end
 


private

    def set_ticket
      @ticket = Ticket.find(params[:id])      
    end

    def ticket_params
      params.permit(:id, :ticket_desk_id, :cinema_hall_id, :paid)
    end

    def ticket_available?
      @cinema_hall = CinemaHall.find(params[:cinema_hall_id])
      Ticket.where(cinema_hall_id: params[:cinema_hall_id], paid: true).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume)
    end

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end
    
end
