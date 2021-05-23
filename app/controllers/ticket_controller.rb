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
    @ticket = Ticket.create(ticket_params)
    @ticket.paid = true
    @ticket.save!
    render :json => "Ticket has been bought"
  end

  def buy
    #Cant buy if there is not such ticketdesk or cinemahall
    if Ticket.count != CinemaHall.where([id: params[:cinema_hall_id]]).volume
      if !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
        if Ticket.exists?(paid: false)
          Ticket.where(:paid => false).update_all(paid: true)
        else
          @ticket=Ticket.create(ticket_params)
          @ticket.before_save
        end
      end
    else
      render :json => "Couldnt buy the ticket, Room is full of people."
    end
  end

  def booked
    if Ticket.count != CinemaHall.where([id: params[:cinema_hall_id]]).volume

      if !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
        ticket_params[:paid] = false
        @ticket = Ticket.create(ticket_params)
        @ticket.save!
        render json: @ticket
      end
    render :json => "Couldnt bookin the ticket, Room is full of people."
    end
  end



private

    def set_ticket
      @ticket = Ticket.find(params[:id])      
    end

    def ticket_params
      params.permit(:id, :ticket_desk_id, :cinema_hall_id, :paid)
    end
end
