module Repositories
    class MovieRepository  < ::Repositories::Base
        attr_reader :adapter

        def initialize(adapter: Models::Movie)
            @adapter = adapter
        end
    end
end