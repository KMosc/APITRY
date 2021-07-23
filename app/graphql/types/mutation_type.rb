module Types
  class MutationType < Types::BaseObject
    # Create Types
    field :create_ticket_desk, mutation: Mutations::CreateTicketDeskMutation
    field :create_cinema_hall, mutation: Mutations::CreateCinemaHallMutation
    field :create_genre, mutation: Mutations::CreateGenreMutation
    field :create_movie, mutation: Mutations::CreateMovieMutation
    field :create_ticket, mutation: Mutations::CreateTicketMutation

    # Delete Types
    field :delete_ticket_desk, mutation: Mutations::DeleteTicketDeskMutation
    field :delete_cinema_hall, mutation: Mutations::DeleteCinemaHallMutation
    field :delete_genre, mutation: Mutations::DeleteGenreMutation
    field :delete_movie, mutation: Mutations::DeleteMovieMutation


    # Update Types
    field :update_ticket_desk, mutation: Mutations::UpdateTicketDeskMutation
    field :update_cinema_hall, mutation: Mutations::UpdateCinemaHallMutation
    field :update_genre, mutation: Mutations::UpdateGenreMutation
    field :update_movie, mutation: Mutations::UpdateMovieMutation
    def test_field
      "Hello World"
    end
  end
end
