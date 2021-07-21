module Resolvers
    class ListTickets < GraphQL::Schema::Resolver
      description "List tickets"

      type [Types::TicketType], null: false
      argument :email, String, required: true

      def resolve(email:)
        tickets = Tickets::Representer.new(Repository::TicketRepository(Ticket.where(email: email)))
      end
    end
  end