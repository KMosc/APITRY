module Resolvers
    class ListMovies < GraphQL::Schema::Resolver
      description "List movies "

      type [Types::MovieType], null: false
      argument :id, ID, required: true

      def resolve(id:)
        movies = Movie.where(
            cinema_hall_id: id
          ).order(title: :asc)
      end
    end
  end