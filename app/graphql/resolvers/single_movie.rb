module Resolvers
    class SingleMovie < GraphQL::Schema::Resolver
      description "Single movie details"

      type Types::MovieType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        movies = Movie.where(
            id: id
          ).order(title: :asc)
      end
    end
end