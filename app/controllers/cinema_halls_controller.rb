class CinemaHallsController < ApplicationController
  before_action :set_cinema_hall, only: [:show, :update, :destroy]

  def index
    if Repository::TicketDeskRepository.new(TicketDesk).exists?(id: params[:ticket_desk_id])
      render json: CinemaHalls::Representer.new(CinemaHall.all).single.order(volume: :asc) , except: [:created_at, :updated_at]
    end
  end

  def show
  end

  def create
    repository=Repository::CinemaHallRepository.new(CinemaHall)
    if UseCase::CinemaHalls::Create.new(repository).call(cinema_hall_params)
      render json: ["log": "success"]
    else
      render json: ["log": "failure"]
    end
  end

  def update
    repository=Repository::CinemaHallRepository.new(CinemaHall)
    if UseCase::CinemaHalls::Update.new(repository).call(cinema_hall_params)
      render json: ["log": "success"]
    else
      render json: ["log": "failure"]
    end
  end

  def destroy
    repository=Repository::CinemaHallRepository.new(CinemaHall)
    UseCase::CinemaHalls::Delete.new(repository).call(id: params[:id])
    @cinema_hall.destroy
  end

  private
    def set_cinema_hall
      repository=Repository::CinemaHallRepository.new(CinemaHall)
      @cinema_hall = repository.find_by(params[:id])
    end

    def cinema_hall_params
      params.permit(:id, :volume)
    end
end