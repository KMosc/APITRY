module Mutations
    class CreateTicketMutation < BaseMutation
      argument :title, String, required: true
      argument :paid, Boolean, required: true
      argument :password, String, required: true
      argument :seat, String, required: true
      argument :cinema_hall_id, ID, required: true
      argument :movie_id, ID, required: true

      def resolve(**args)
        wrapper = Buy::Decorator.new(
              Repository::TicketRepository.new, 
              Repository::CinemaHallRepository.new
              )
        use_case=UseCase::Decorator::Buy.new(wrapper, args).call
        {status: 200}
      end
    end
end
  