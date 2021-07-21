module Resolvers
    class Genre < GraphQL::Schema::Resolver
      description "Single genre details"

      type ::Types::GenreType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Genres::Representer.new(Genre.where(id: id)).single.order(title: :asc)
      end
    end
  end