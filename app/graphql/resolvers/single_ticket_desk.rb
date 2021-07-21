module Resolvers
    class SingleTicketDesk < GraphQL::Schema::Resolver
      description "Single Ticket Desk"

      type ::Types::TicketDeskType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        TicketDesks::Representer.new(
            TicketDesk.where(id: id)
            ).single
        rescue ActiveRecord::RecordNotFound => error
          raise GraphQL::ExecutionError, error.message
        end
    end
end