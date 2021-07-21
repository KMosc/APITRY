module Resolvers
    class ListPaymentHistories < GraphQL::Schema::Resolver
      description "List payment histories "

      type [Types::PaymentHistoryType], null: false
      argument :email, String, required: true

      def resolve(email:)
        payments = PaymentHistory.where(email: email)
      end
    end
  end