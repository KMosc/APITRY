module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :ticket_desk, resolver: ::Resolvers::SingleTicketDesk
    field :ticket_desks, resolver: ::Resolvers::ListTicketDesks

    field :cinema_hall, resolver: ::Resolvers::SingleCinemaHall
    field :cinema_halls, resolver: ::Resolvers::ListCinemaHalls

    field :genres, resolver: ::Resolvers::ListGenres

    field :movie, resolver: ::Resolvers::SingleMovie
    field :movies, resolver: ::Resolvers::ListMovies

    field :list_payment_histories, resolver: ::Resolvers::ListPaymentHistories
    field :list_tickets, resolver: ::Resolvers::ListTickets
    field :ticket, resolver: ::Resolvers::SingleTicket


    def test_field
      "Hello World!"
    end
  end
end
