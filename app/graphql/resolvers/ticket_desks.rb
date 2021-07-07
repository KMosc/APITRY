module Resolvers
    class TicketDesks < GraphQL::Schema::Resolver
      description "List Ticket Desks"

      type [::Types::TicketDeskType], null: false
        
      def resolve
        TicketDesks::Representer.new(
          TicketDesk.all
          ).single.order(name: :asc)
      end
    end
  end