module Resolvers
    class ListMovies < GraphQL::Schema::Resolver
      description "List movies "

      type [Types::MovieType], null: false
      argument :id, ID, required: true

      def resolve(id:)
        movies = Movie.where(
            cinema_hall_id: id
          ).order(title: :asc)
        rescue ActiveRecord::RecordNotFound => error
          raise GraphQL::ExecutionError, error.message
        end
      end
    end