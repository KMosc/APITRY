class TicketDesksController < ApplicationController
  skip_before_action :doorkeeper_authorize!, only: %i[index show]

  # GET /ticket_desks
  def index
      render json: TicketDesks::Representer.new(TicketDesk.all).single.order(name: :asc) , except: [:created_at, :updated_at]
  end

  def show
  end

  def create
    #if employer?
    repository=Repository::TicketDeskRepository.new()
    self.post_success(repository)
    #else
    render json: ["error": "You are not employee"]
    #end
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
