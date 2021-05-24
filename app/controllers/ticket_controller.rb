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
    if ticket_available? && route_availabe?
      if !Ticket.where(:paid => false).update_all(paid: true)
        @ticket=Ticket.create_with(ticket_params)
        @ticket.paid = true
        @ticket.save!
        render :json => "Ticket has been bought."
      else
        render :json => "You've paid for ticket that You had booked."
      end
    else
      render :json => "Couldnt buy the ticket, Room is full of people."
    end
  end

  def booked
    if ticket_available? && route_availabe?
        ticket_params[:paid] = false
        @ticket = Ticket.create_with(ticket_params)
        @ticket.save!
        render :json => "Ticket has been booked in."
        
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
      @cinema_hall = CinemaHall.find(ticket_params[:cinema_hall_id])
      Ticket.where(cinema_hall_id: ticket_params[:cinema_hall_id]).count(:all) != @cinema_hall.read_attribute_before_type_cast(:volume)
    end

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end
    
end
