class TicketController < ApplicationController

  def index     
    if !params[:password].blank? 
      @tickets = Repository::TicketRepository.new.where(ticket_params)
      render json: @tickets, except: [:password, :created_at, :updated_at, :ticket_desk_id]
    else
      render json: Decorator::Buy::Representer.new(
        Buy::Decorator.new(
          Repository::CinemaHallRepository.new, Repository::TicketRepository.new
          )
        ).seats_not_taken(params[:id], params[:cinema_hall_id], params[:movie_id])
    end
  end

  def show
    render json:[]
  end
  
  def new
    @ticket = Repository::TicketRepository.new.new
  end

  def create
    left_Repository = Repository::TicketRepository.new
      right_Repository = Repository::CinemaHallRepository.new
      wrapper = Buy::Decorator.new(left_Repository, right_Repository)
      @buy = self.post_success(wrapper)
      if @buy
        self.mail
        render json: ["log": "success"]
      else
        render json: ["log": "failed"], status: :unprocessable_entity
      end
    end
      
  def bookin
    repo = Repository::TicketRepository.new
    @reservation = repo.make_reservation(ticket_params)
    if !@reservation
      render jsonapi_errors: @reservation.errors, status: :unprocessable_entity
    else 
      render json: Tickets::Representer.new(repo).single
    end
  end

private

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end

    def post_success(wrapper)
      usecase =UseCase::Decorator::Buy.new(wrapper)
      usecase.call(params[:id], params[:password], ticket_params, params[:seat], params[:cinema_hall_id], params[:movie_id])
    end

    def ticket_params
      params.permit(:id, :paid, :password, :seat, :ticket_desk_id, :cinema_hall_id, :movie_id)
    end    

    def mail
      TicketMailer.with(
        password: params[:password], 
        cinema_hall_id: params[:cinema_hall_id], 
        movie_id: params[:movie_id], 
        seat: params[:seat] 
        ).mail_after_success_buy.deliver_now!
    end
end