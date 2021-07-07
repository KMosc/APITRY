module Resolvers
    class Movies < GraphQL::Schema::Resolver
      description "List movies "

      type [::Types::MovieType], null: false
      argument :cinema_hall_id, ID, required: true

      def resolve(id:)
        movies = Movie.where(
            cinema_hall_id: id
          ).order(title: :asc)
      end
    end
  end