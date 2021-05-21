class TicketController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index
  @ticket = Ticket.all.order(paid: :desc)
	render json: @ticket
  end
  def show
    render json: @ticket
  end
  def create

      render json: Ticket.new(ticket_params)
  end

  def buy
    @ticket = Ticket.new(ticket_params)
    @ticket.save(paid: true)
    render json: @ticket
  end
    
    def reservation
      @ticket = Ticket.new(ticket_params)
      @ticket.save(paid: false)

      render json: @ticket
    end

private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
    def ticket_params
      params.require(:ticket).permit(:paid, :cinema_hall_id, :ticket_desk_id)
    end
end
