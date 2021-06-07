class GenreController < ApplicationController
  

  def index
      render json: Genres::Representer.new(Genre.all).single.order(title: :asc), except: [:created_at, :updated_at]
  end

# GET /cinema_halls/1
def show
end

# POST /cinema_halls
def create
  if employer?
    repository=Repository::GenreRepository.new
    @genre=self.post_success(repository)
  else
    render json: ["error": "You are not employee"]
  end
end

# DELETE /cinema_halls/1
def destroy
  @genre.destroy
end

private
  # Only allow a list of trusted parameters through.
  def post_success(repository)
    if UseCase::Genres::Create.new(repository).call(genre_params)
      render json: ["log": "success"]
    else
      render json: ["log": "failure"]
    end
  end

  def genre_params
    params.permit(:id, :title, :description)
  end
end
