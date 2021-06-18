class MoviesController < ApplicationController
  skip_before_action :doorkeeper_authorize!, only: %i[index show]

  def index
      if (params.has_key?(:cinema_hall_id))
        movies = Movie.where(
          cinema_hall_id: params[:cinema_hall_id]
        ).order(title: :asc)
      else
        movies = Movie.all
      end
      render json: movies
  end

  def show
  end
  def new
    
  end
  def create
      if employer?
        repository=Repository::MovieRepository.new
        self.post_success(repository)
      else
        render json: ["error": "You are not employee"]
      end
  end

  private
  # Only allow a list of trusted parameters through.
  def movie_params
    params.permit(:id, :title, :description, :age_restriction, :starts_at, :ends_at, :genre_id, :cinema_hall_id)
  end
  # Post Request succesful
    def post_success(repository)
      if UseCase::Movies::Create.new(repository).call(movie_params)
        render json: ["log": "success"]
      end
    end
    
end