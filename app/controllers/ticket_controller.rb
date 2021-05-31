class TicketController < ApplicationController
  before_action :set_ticket, only: []

  def index     
    if !params[:password].blank?
      @tickets = Ticket.where(movie_id: params[:movie_id], password: params[:password], ticket_desk_id: params[:ticket_desk_id], cinema_hall_id: params[:cinema_hall_id])    
      render json: @tickets, except: [:password, :created_at, :updated_at, :ticket_desk_id]
    else
      render json: seats_not_taken
    end
  end

  def show
    render json:[]
  end
  
  def new
    @ticket = Ticket.new
  end

  def create
    repo = Repositories::TicketRepository.new(Ticket)
    usecase =UseCase::Tickets::Buy.new(repo)
    if usecase.call(params[:password], ticket_params, params[:seat], params[:cinema_hall_id], params[:movie_id])
      render json: ["log": "success"]
    else
      render json: ["log": "Error"]
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
      (Ticket.where(params[:movies_id]).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume) ) 

    end

    def seats_not_taken
      return {"empty_seats":
      (
      UseCase::CinemaHalls::GenerateSeats.new(
        Repositories::CinemaHallRepository.new(CinemaHall)
      ).call(params[:cinema_hall_id]) - (
        UseCase::Tickets::Taken.new(
          Repositories::TicketRepository.new(Ticket)
      ).call)
      )
    }
    end



      

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])      
    end

    def ticket_params
      params.permit(:id, :paid, :password, :seat, :ticket_desk_id, :cinema_hall_id, :movie_id)
    end    

end
