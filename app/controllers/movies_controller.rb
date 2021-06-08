class MoviesController < ApplicationController

  def index
      #link = CinemaHall.where(cinema_hall_id: params[:cinema_hall_id])
      #throw(:abort) unless link 
      render json: Movies::Representer.new(Movie.all).single.where(
        cinema_hall_id: params[:cinema_hall_id]
      ).order(title: :asc), except: [:created_at, :updated_at]
  end

  def show
  end
  def new
    
  end
  def create
      #if employer?
      repository=Repository::MovieRepository.new
      self.post_success(repository)
      #else
       # render json: ["error": "You are not employee"]
      #end
  end

  def destroy
    repository=Repository::MovieRepository.new
    UseCase::Movies::Delete.new.call(id: params[:id])
  end

  private
  def movie_params
    params.permit(:id, :title, :description, :age_restriction, :starts_at, :ends_at, :genre_id, :cinema_hall_id)
  end
  
    # Only allow a list of trusted parameters through.
    def post_success(repository)
      if UseCase::Movies::Create.new(repository).call(movie_params)
        render json: ["log": "success"]
      else
        render json: ["log": "failure"]
      end
    end
    
end