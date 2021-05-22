class CinemaHallsController < ApplicationController
  before_action :set_cinema_hall, only: [:show, :update, :destroy]

  # GET /cinema_halls
  def index
    if TicketDesk.exists?(id: params[:ticket_desk_id])
      @cinema_halls = CinemaHall.all.order(volume: :desc)

      render json: @cinema_halls
    else
      render :json => []

    end
  end

  # GET /cinema_halls/1
  def show
  end

  # POST /cinema_halls
  def create
      render json: CinemaHall.new(cinema_hall_params)
  end

  # PATCH/PUT /cinema_halls/1
  def update
    if @cinema_hall.update(cinema_hall_params)
      render json: @cinema_hall
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
    def set_cinema_hall
      @cinema_hall = CinemaHall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cinema_hall_params
      params.permit(:id, :volume)
    end
end
