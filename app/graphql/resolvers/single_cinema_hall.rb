module Resolvers
    class SingleCinemaHall < GraphQL::Schema::Resolver
      description "Single cinema hall details"

      type Types::CinameHallType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        CinemaHall.find(id)
      end
    end
  end