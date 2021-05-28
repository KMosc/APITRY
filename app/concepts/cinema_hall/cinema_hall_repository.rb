module Repositories
    class CinemaHallRepository
        attr_reader :adapter

        def initialize(adapter: Models::CinemaHall)
            @adapter = adapter
        end
    end
end