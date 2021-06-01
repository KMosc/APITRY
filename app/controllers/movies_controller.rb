class MoviesController < ApplicationController

  def index
    if Repository::TicketDeskRepository.new(TicketDesk).exists?(id: params[:ticket_desk_id])
      render json: Movies::Representer.new(Movie.all).single.where(
        cinema_hall_id: params[:cinema_hall_id]
      ).order(title: :asc), except: [:created_at, :updated_at]
    end
  end

  def show
  end

  def create
      repository=Repository::MovieRepository.new(Movie)
      if UseCase::Movies::Create.new(repository).new(movie_params)
        render json: ["log": "success"]
      else
        render json: ["log": "failure"]
      end
  end

  def destroy
    repository=Repository::MovieRepository.new(Movie)
    UseCase::Movies::Delete.new(repository).call(id: params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
    def movie_params
      params.permit(:id, :title, :description, :age_restriction, :starts_at, :ends_at, :genre_id, :cinema_hall_id)
    end
end
