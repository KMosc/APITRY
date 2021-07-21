module Resolvers
    class SignleTicket < GraphQL::Schema::Resolver
      description "single ticket"

      type Types::TicketType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        tickets = Tickets::Representer.new(Repository::TicketRepository(Ticket.where(id: id)))
      end
    end
  end