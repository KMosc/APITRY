module Mutations
    class TicketMutation < BaseMutation
      argument :title, String, required: false
      argument :paid, Boolean, required: false
      argument :password, String, required: false
      argument :seat, String, required: false
      argument :cinema_hall_id, ID, required: false
      argument :movie_id, ID, required: false

      def resolve(**args)
        wrapper = Buy::Decorator.new(
              Repository::TicketRepository.new, 
              Repository::CinemaHallRepository.new
              )
        UseCase::Decorator::Buy.new(wrapper, args)
        {status: 200}
      end
    end
end
  