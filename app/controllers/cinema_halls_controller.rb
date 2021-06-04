class CinemaHallsController < ApplicationController
  
  def index
      render json: CinemaHalls::Representer.new(CinemaHall.all).single.order(volume: :asc) , except: [:created_at, :updated_at]
  end

  def show
  end

  def create
    repository=Repository::CinemaHallRepository.new
    post_success(repository) 
  end

  def update
    repository=Repository::CinemaHallRepository.new
    if UseCase::CinemaHalls::Update.new(repository).call(cinema_hall_params)
      render json: ["log": "success"]
    else
      redirect_to(root_url, :notice => 'Record not found')
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