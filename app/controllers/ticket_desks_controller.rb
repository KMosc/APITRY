class TicketDesksController < ApplicationController
  before_action :set_ticket_desk, only: [:show]
  # GET /ticket_desks
  def index
    @ticket_desks = TicketDesk.order(automated: :desc)
    render json: @ticket_desks
  end

  def show
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
  private
    def set_ticket_desk
      @ticket_desk = TicketDesk.find(params[:id])
    end
    def ticket_desk_params
      params.permit(:id, :name, :automated)
    end
end
