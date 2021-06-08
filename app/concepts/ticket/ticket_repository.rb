module Repository
    class TicketRepository < ::Repository::Base
        def initialize(adapter: Ticket)
            @adapter = adapter
        end
        def where(params)
          adapter.where(params)
        end
    end
end