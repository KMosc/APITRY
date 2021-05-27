class TicketDesksController < ApplicationController
  before_action :set_ticket_desk, only: [:show]
  # GET /ticket_desks
  def index
    @ticket=TicketDesk.order(automated: :desc).map do |shop| {
      id: shop.id,
      name: shop.name,
      automated: shop.automated
      }
    end
    render json: @ticket, except: [:created_at, :updated_at]

  end

  def show
  end

  # POST /ticket_desks
  def create
    @ticket_desk = TicketDesk.create(ticket_desk_params)

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
