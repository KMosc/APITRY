module Repositories
    class MovieRepository
        attr_reader :adapter

        def initialize(adapter: Models::Movie)
            @adapter = adapter
        end
    end
end