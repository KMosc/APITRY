class TicketController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index                                       
  @tickets = Ticket.where(ticket_desk_id: params[:ticket_desk_id]).where(cinema_hall_id: params[:cinema_hall_id])
 
	render json: @tickets
  end
  def show
    render json: @ticket
  end
  def create
    @ticket = Ticket.create(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def buy
    puts ticket_params

    @ticket = Ticket.create(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
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
      params.permit(:id, :ticket_desk_id, :cinema_hall_id, :paid)
    end
end

