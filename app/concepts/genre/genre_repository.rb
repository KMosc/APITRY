module Repository
    class GenreRepository  < ::Repository::Base
        def initialize(adapter: Genre)
            @adapter = adapter
        end
    end
end