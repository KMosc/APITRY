class CinemaHallsController < ApplicationController
  before_action :authenticate_user!

  def index
      render json: CinemaHalls::Representer.new(CinemaHall.all).single.order(volume: :asc) , except: [:created_at, :updated_at]
  end

  def show
  end

  def create
    if employer?
      repository=Repository::CinemaHallRepository.new
      post_success(repository) 
    else
      render json: ["error": "You are not employee"]
    end
  end

  def update
    if employer?
      repository=Repository::CinemaHallRepository.new
      if UseCase::CinemaHalls::Update.new(repository).call(cinema_hall_params)
        render json: ["log": "success"]
      else
        throw(:abort)
      end
    else
      render json: ["error": "You are not employee"]
    end
  end

  def destroy
    repository=Repository::CinemaHallRepository.new
    UseCase::CinemaHalls::Delete.new(repository).call(id: params[:id])
  end

  private

    def post_success(repository)
      if UseCase::Movies::Create.new(repository).new(cinema_hall_params)
        render json: ["log": "success"]
      else
        render json: ["log": "failure"]
      end
    end

    def cinema_hall_params
      params.permit(:id, :volume)
    end
end