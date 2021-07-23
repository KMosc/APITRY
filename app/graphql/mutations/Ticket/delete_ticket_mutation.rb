module Mutations
    class DeleteTicketMutation < BaseMutation
      argument :id, String, required: true

      def resolve(**args)
        wrapper = Buy::Decorator.new(
              Repository::TicketRepository.new, 
              Repository::CinemaHallRepository.new
              )
        UseCase::Decorator::Delete.new(wrapper, args)
        {status: 200}
      end
    end
end
  