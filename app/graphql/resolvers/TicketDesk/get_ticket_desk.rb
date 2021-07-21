module Resolvers
    class GetTicketDesk < GraphQL::Schema::Resolver
      description "Single Ticket Desk"

      type ::Types::TicketDeskType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        TicketDesks::Representer.new(
            TicketDesk.where(id: id)
            ).single
      end
    end
  end