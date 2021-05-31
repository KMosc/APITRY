module Repository
    class GenreRepository  < ::Repository::Base
        attr_reader :adapter

        def initialize(adapter: Models::Genre)
            @adapter = adapter
        end
    end
end