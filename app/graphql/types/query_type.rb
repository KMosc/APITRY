module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :ticket_desk, resolver: ::Resolvers::GetTicketDesk
    field :ticket_desks, resolver: ::Resolvers::ListTicketDesks

    field :cinema_hall, resolver: ::Resolvers::GetCinemaHall
    field :cinema_halls, resolver: ::Resolvers::ListCinemaHalls

    field :genres, resolver: ::Resolvers::ListGenres

    field :movie, resolver: ::Resolvers::GetMovie
    field :movies, resolver: ::Resolvers::ListMovies

    def test_field
      "Hello World!"
    end
  end
end
