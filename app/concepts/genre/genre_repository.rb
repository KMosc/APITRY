module Repositories
    class GenreRepository
        attr_reader :adapter

        def initialize(adapter: Models::Genre)
            @adapter = adapter
        end
    end
end