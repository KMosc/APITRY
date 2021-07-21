module Resolvers
    class SingleGenre < GraphQL::Schema::Resolver
      description "Single genre details"

      type ::Types::GenreType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Genres::Representer.new(Genre.where(id: id)).single.order(title: :asc)
        rescue ActiveRecord::RecordNotFound => error
          raise GraphQL::ExecutionError, error.message
        end
    end
end