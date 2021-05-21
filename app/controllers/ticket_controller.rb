class TicketController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index
  @ticket = Ticket.all

	render json: @ticket
  end
  def show
    render json: @ticket
  end
  def buy
    @ticket = Ticket.new(ticket_params)
    @ticket.paid = false

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end
    
    def reservation
        @ticket = Ticket.new(ticket_params)
        @ticket.paid = false
        
    
        if @ticket.save
          render json: @ticket, status: :created, location: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
    def ticket_params
      params.require(:ticket).permit(:ticket_desk_id, :cinema_hall_id, :paid)
    end
end
