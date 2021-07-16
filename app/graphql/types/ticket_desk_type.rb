module Types
  class TicketDeskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :automated, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
