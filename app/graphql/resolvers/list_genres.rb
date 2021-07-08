module Resolvers
    class ListGenres < GraphQL::Schema::Resolver
      description "Single Genre"

      type [::Types::GenreType], null: false

      def resolve
        Genres::Representer.new(
          Genre.all
          ).single.order(title: :asc)
      end
    end
  end