require 'date'

class TicketController < ApplicationController
  skip_before_action :doorkeeper_authorize!, only: %i[index show]


  def index   
    @link = Movie.find_by(id: params[:movie_id], cinema_hall_id: params[:cinema_hall_id])
    throw :abort unless @link 
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
      if (params[:paid].eql?(true))
        if DateTime.now.hour*60- DateTime.now.min > movie[:starts_at].hour*60+movie[:starts_at].min
          nump_minute = 24.hour*60 - DateTime.now.hour*60- DateTime.now.min + movie[:starts_at].hour*60+movie[:starts_at].min-30.minutes
        else
          nump_minute = movie[:starts_at].hour*60+movie[:starts_at].min - DateTime.now.hour*60- DateTime.now.min
        end
        TicketsCleanupJob.set(wait: nump_minute.minutes).perform_later(nump_minute,ticket_params, params[:password], movie, params[:seat])
      else
        self.send_ticket_mail
      end
      render json: ["log": "success"]
    else
      render json: ["log": "failure"]
    end
  end
    

private

    def route_availabe?
      !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
    end

    def post_success(wrapper)
      usecase =UseCase::Decorator::Buy.new(wrapper)
      usecase.call(params[:id], params[:password], ticket_params)
    end

    def ticket_params
      params.permit(:id, :paid, :password, :seat, :ticket_desk_id, :cinema_hall_id, :movie_id)
       
    end    

    def send_ticket_mail
      TicketMailer.with(
        password: params[:password], 
        cinema_hall_id: params[:cinema_hall_id], 
        movie_id: params[:movie_id], 
        seat: params[:seat] 
        ).mail_after_success_buy.deliver_now!
    end
end