module Resolvers
    class ListCinemaHalls < GraphQL::Schema::Resolver
      description "list cinema halls"

      type [Types::CinameHallType], null: false

      def resolve
        CinemaHall.all.order(volume: :asc)
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message
      end
    end
  end