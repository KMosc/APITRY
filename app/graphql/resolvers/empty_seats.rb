module Resolvers
    class EmptySeats < GraphQL::Schema::Resolver
      description "Empty Seats"

      type [String], null: false
      argument :cinema_hall_id, ID, required: true
      argument :movie_id, ID, required: true

      def resolve(**args)
        Decorator::Buy::Representer.new(
          Buy::Decorator.new(
            Repository::CinemaHallRepository.new, 
            Repository::TicketRepository.new
            )
          ).seats_not_taken(
            args
            )
      end
    end
  end