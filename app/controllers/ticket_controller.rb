class TicketController < ApplicationController
  before_action :set_ticket, only: []

  def index     
    if !params[:password].blank?
      @tickets = Repositories::TicketRepository.new(Ticket).where(ticket_params)    
      render json: @tickets, except: [:password, :created_at, :updated_at, :ticket_desk_id]
    else
      render json: Tickets::Representer.new(Repositories::TicketRepository.new(Ticket)).seats_not_taken(params[:cinema_hall_id])
    end
  end

  def show
    render json:[]
  end
  
  def new
    @ticket = Repositories::TicketRepository.new(Ticket).new
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
    repo = Repositories::TicketRepository.new(Ticket)
    if repo.make_reservation(ticket_params)
      render json: Tickets::Representer.new(repo).single
    else 
      render json: ["log": "error"]
    end
  end

private

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
