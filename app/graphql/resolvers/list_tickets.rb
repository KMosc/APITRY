module Resolvers
    class ListTickets < GraphQL::Schema::Resolver
      description "List tickets"

      type [Types::TicketType], null: false
      argument :email, String, required: true

      def resolve(email:)
        Ticket.find(:all, :conditions => { email => email })
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message
      end
    end
  end