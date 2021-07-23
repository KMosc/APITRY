module Resolvers
    class SingleMovie < GraphQL::Schema::Resolver
      description "Single movie details"

      type Types::MovieType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        movies = Movie.where(
            id: id
          ).order(title: :asc)
        rescue ActiveRecord::RecordNotFound => error
          raise GraphQL::ExecutionError, error.message
        end
    end
end