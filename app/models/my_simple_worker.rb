class MySimpleWorker
  include Sidekiq::Worker

  def perform(ticket_params, params)
    leftRepository = Repository::TicketRepository.new(Ticket)
    rightRepository = Repository::CinemaHallRepository.new(CinemaHall)

    wrapper = Buy::Decorator.new(leftRepository, rightRepository)
    usecase =UseCase::Decorator::Buy.new(wrapper)
    if usecase.call(params[:password], ticket_params, params[:seat], params[:cinema_hall_id], params[:movie_id])
      render json: Tickets::Representer.new(leftRepository).success
    else
      render json: Tickets::Representer.new(leftRepository).error
    end
  end
end
