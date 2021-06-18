module Repository
    class PaymentHistoryRepository  < ::Repository::Base
        def initialize(adapter: PaymentHistory)
            @adapter = adapter
        end
    end
end