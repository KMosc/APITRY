module Repositories
    class CinemaHallRepository  < ::Repositories::Base
        attr_reader :adapter

        def initialize(adapter: Models::CinemaHall)
            @adapter = adapter
        end
    end
end