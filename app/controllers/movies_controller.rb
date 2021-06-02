class MoviesController < ApplicationController

  def index
    if self.validate?
      render json: Movies::Representer.new(Movie.all).single.where(
        cinema_hall_id: params[:cinema_hall_id]
      ).order(title: :asc), except: [:created_at, :updated_at]
    end
  end

  def show
  end

  def create
      repository=Repository::MovieRepository.new
      self.post_success(repository)
  end

  def destroy
    repository=Repository::MovieRepository.new
    UseCase::Movies::Delete.new(repository).call(id: params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
    def post_success
      if UseCase::Movies::Create.new(repository).call(movie_params)
        render json: ["log": "success"]
      else
        render json: ["log": "failure"]
      end
    end
    
    def validate?
      Repository::TicketDeskRepository.new.exists?(id: params[:ticket_desk_id])
    end
end