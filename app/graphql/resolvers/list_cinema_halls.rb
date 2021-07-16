module Resolvers
    class ListCinemaHalls < GraphQL::Schema::Resolver
      description "list cinema halls"

      type [Types::CinameHallType], null: false

      def resolve
        CinemaHall.all.order(volume: :asc)
      end
    end
  end