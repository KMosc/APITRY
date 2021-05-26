class GenreController < ApplicationController
  def index
    @genre = Genre.order(id: :desc)

    render json: @genre
end

# GET /cinema_halls/1
def show
end

# POST /cinema_halls
def create
    render json: Genre.create(genre_params)
end

# PATCH/PUT /cinema_halls/1
def update
  if @genre.update(genre_params)
    render json: @genre
  else
    render json: @genre.errors, status: :unprocessable_entity
  end
end

# DELETE /cinema_halls/1
def destroy
  @genre.destroy
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = Genre.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def genre_params
    params.permit(:id, :title, :description)
  end
end
