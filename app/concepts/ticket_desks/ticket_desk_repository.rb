module Repository
    class TicketDeskRepository < ::Repository::Base

        def initialize(adapter: TicketDesk)
            @adapter = adapter
        end
    end
end