module Resolvers
    class CinemaHalls < GraphQL::Schema::Resolver
      description "list cinema halls"

      type [::Types::CinemaHallType], null: false

      def resolve
        CinemaHall.all.order(volume: :asc)
      end
    end
  end