module Repositories
    class TicketDeskRepository < ::Repositories::Base
        attr_reader :adapter

        def initialize(adapter: Models::TicketDesk)
            @adapter = adapter
        end
    end
end