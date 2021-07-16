module Types
  class TicketType < Types::BaseObject
    field :id, ID, null: false
    field :paid, Boolean, null: true
    field :password, String, null: true
    field :seat, String, null: true
    field :ticket_desk, Types::TicketDeskType, null: true
    field :cinema_hall, Types::CinameHallType, null: true
    field :movie, Types::MovieType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
