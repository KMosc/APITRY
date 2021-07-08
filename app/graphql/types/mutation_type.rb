module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :ticket_desk, mutation: Mutations::TicketDeskMutation
    field :cinema_hall, mutation: Mutations::CinemaHallMutation
    field :genre, mutation: Mutations::GenreMutation
    field :movie, mutation: Mutations::MovieMutation

    def test_field
      "Hello World"
    end
  end
end
