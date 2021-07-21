module Resolvers
    class SingleTicket < GraphQL::Schema::Resolver
      description "single ticket"

      type Types::TicketType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        tickets = Tickets::Representer.new(Repository::TicketRepository(Ticket.find(id)))
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message
      end
  end
end