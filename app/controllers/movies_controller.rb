class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /cinema_halls
  def index

      render json: Movie.where(cinema_hall_id: params[:cinema_hall_id]).order(title: :desc).map do |movie| {
        id: movie.id, 
        title: movie.title, 
        description: movie.description, 
        age_restriction: movie.age_restriction, 
        starts_at: movie.starts_at, 
        ends_at: movie.ends_at,
        genre_id: movie.genre_id
      }
    end
  end

  # GET /cinema_halls/1
  def show
  end

  # POST /cinema_halls
  def create
      render json: Movie.create(movie_params)
  end

  # PATCH/PUT /cinema_halls/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @cinema_hall.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cinema_halls/1
  def destroy
    @cinema_hall.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find_by(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.permit(:id, :title, :description, :age_restriction, :starts_at, :ends_at, :genre_id, :cinema_hall_id)
    end
end
