module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :ticket_desk, mutation: Mutations::TicketDeskMutation

    def test_field
      "Hello World"
    end
  end
end
