module Resolvers
    class ListPaymentHistories < GraphQL::Schema::Resolver
      description "List payment histories "

      type [Types::PaymentHistoryType], null: false
      argument :email, String, required: true

      def resolve(email:)
        payments = PaymentHistory.find(:all, :conditions => { email => email })
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message
      end
    end
  end