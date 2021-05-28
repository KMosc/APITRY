module Repositories
    class TicketDeskRepository
        attr_reader :adapter

        def initialize(adapter: Models::TicketDesk)
            @adapter = adapter
        end
    end
end