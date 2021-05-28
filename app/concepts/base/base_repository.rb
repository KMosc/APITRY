module Repositories
    class Base
        attr_reader :adapter

        def initialize(adapter)
            @adapter = adapter
        end
        
    end
end
