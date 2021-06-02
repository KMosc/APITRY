module Repository
    class MovieRepository  < ::Repository::Base
        attr_reader :adapter

        def initialize(adapter: Movie)
            @adapter = adapter
        end
    end
end