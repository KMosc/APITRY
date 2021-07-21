module Types
  class PaymentHistoryType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :seat, String, null: true
    field :movie, Types::MovieType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
