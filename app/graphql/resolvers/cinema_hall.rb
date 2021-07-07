module Resolvers
    class CinemaHall < GraphQL::Schema::Resolver
      description "Single cinema hall details"

      type ::Types::CinemaHallType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        CinemaHall.find(id)
      end
    end
  end