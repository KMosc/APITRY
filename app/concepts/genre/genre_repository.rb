module Repositories
    class GenreRepository  < ::Repositories::Base
        attr_reader :adapter

        def initialize(adapter: Models::Genre)
            @adapter = adapter
        end
    end
end