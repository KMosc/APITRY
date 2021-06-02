module Repository
    class CinemaHallRepository  < ::Repository::Base
        def initialize(adapter: CinemaHall)
            @adapter = adapter
        end
    end
end