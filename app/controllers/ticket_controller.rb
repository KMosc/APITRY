require 'date'

class TicketController < ApplicationController
  skip_before_action :doorkeeper_authorize!, only: %i[index show]


  def index   
    movie = Movie.find_by(id: params[:movie_id], cinema_hall_id: params[:cinema_hall_id])
    raise(ActionController::InvalidAuthenticityToken) unless movie 
    if !params[:receiver].blank? 
      @tickets = Repository::TicketRepository.new.where(ticket_params)
      render json: @tickets, except: [:receiver, :created_at, :updated_at, :ticket_desk_id]
    else
      render json: Decorator::Buy::Representer.new(
        Buy::Decorator.new(
          Repository::CinemaHallRepository.new, 
          Repository::TicketRepository.new
          )
        ).seats_not_taken(
          params
          )
    end
  end

  def show
    render json:[]
  end
  
  def new
    @ticket = Repository::TicketRepository.new.new
  end

  def create
    movie = Movie.find_by(id: params[:movie_id], cinema_hall_id: params[:cinema_hall_id])
    raise(ActionController::InvalidAuthenticityToken) unless movie 
    @left_Repository = Repository::TicketRepository.new
    @right_Repository = Repository::CinemaHallRepository.new
    @wrapper = Buy::Decorator.new(
        Repository::TicketRepository.new, 
        Repository::CinemaHallRepository.new
        )
    buy = self.post_success(@wrapper)
    if buy
      after_payment_success_for(movie)
      render json: ["log": "success"]
    else
      render json: ["log": "failure"]
    end
  end
    

private
  # Only allow a list of trusted parameters through.
    def ticket_params
      params.permit(:id, :paid, :password, :seat, :ticket_desk_id, :cinema_hall_id, :movie_id)
       
    end    


    def post_success(wrapper)
      usecase =UseCase::Decorator::Buy.new(wrapper)
      usecase.call(params[:id], params[:password], ticket_params)
    end

    def send_ticket_mail
      TicketMailer.with(
        password: params[:password], 
        cinema_hall_id: params[:cinema_hall_id], 
        movie_id: params[:movie_id], 
        seat: params[:seat] 
        ).mail_after_success_buy.deliver_now!
    end
    
    def lauching_time_of(movie)
      if DateTime.now.hour*60- DateTime.now.min > movie[:starts_at].hour*60+movie[:starts_at].min
        minutes_left = 24.hour*60 - DateTime.now.hour*60- DateTime.now.min + movie[:starts_at].hour*60+movie[:starts_at].min-30.minutes
      else
        minutes_left = movie[:starts_at].hour*60+movie[:starts_at].min - DateTime.now.hour*60- DateTime.now.min
      end
      minutes_left
    end

    def after_payment_success_for(movie)
      if (params[:paid]== "true" )
        self.send_ticket_mail
      else
        cleanup_job=TicketsCleanupJob.set(wait: lauching_time_of(movie).minutes).perform_later(lauching_time_of(movie),ticket_params, params[:password], movie, params[:seat])
      end
    end
end