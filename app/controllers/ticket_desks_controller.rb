class TicketDesksController < ApplicationController
  before_action :set_ticket_desk, only: [:show]

  # GET /ticket_desks
  def index
    @ticket_desks = TicketDesk.all

    render json: @ticket_desks
  end
  def show
    render json: @cinema_hall
  end
  
  # POST /ticket_desks
  def create
    @ticket_desk = TicketDesk.new(ticket_desk_params)

    if @ticket_desk.save
      render json: @ticket_desk, status: :created, location: @ticket_desk
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end
  end

def buy
@result = Ticket.new(paid: true)
@result.save
end

def reservation
@result = Ticket.new(paid: false)
@result.save
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_desk
      @ticket_desk = TicketDesk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_desk_params
      params.require(:ticket_desk).permit(:name, :automated)
    end
end
