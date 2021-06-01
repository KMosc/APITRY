class GenreController < ApplicationController

  def index
      render json: Genres::Representer.new(Genre.all).single.order(title: :asc), except: [:created_at, :updated_at]
  end

# GET /cinema_halls/1
def show
end

# POST /cinema_halls
def create
  repository=Repository::GenreRepository.new(Genre)
  if UseCase::Genres::Create.new(repository).call(genre_params)
    render json: ["log": "success"]
  else
    render json: ["log": "failure"]
  end
end

# DELETE /cinema_halls/1
def destroy
  @genre.destroy
end

private
  # Only allow a list of trusted parameters through.
  def genre_params
    params.permit(:id, :title, :description)
  end
end
