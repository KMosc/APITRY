module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :ticket_desk, mutation: Mutations::CreateTicketDeskMutation
    field :cinema_hall, mutation: Mutations::CreateCinemaHallMutation
    field :genre, mutation: Mutations::CreateGenreMutation
    field :movie, mutation: Mutations::CreateMovieMutation
    field :ticket, mutation: Mutations::CreateTicketMutation

    def test_field
      "Hello World"
    end
  end
end
