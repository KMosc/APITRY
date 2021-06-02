class TicketDesksController < ApplicationController
  # GET /ticket_desks
  def index
      render json: TicketDesks::Representer.new(TicketDesk.all).single.order(name: :asc) , except: [:created_at, :updated_at]
  end

  def show
  end

  def create
    repository=Repository::TicketDeskRepository.new(TicketDesk)
    self.post_success(repository)
  end

  private

    def post_success(repository)
      if UseCase::TicketDesk::Create.new(repository).call(ticket_desk_params)
        render json: ["log": "success"]
      else
        render json: ["log": "failure"]
      end
    end

    def ticket_desk_params
      params.permit(:id, :name, :automated)
    end
end
