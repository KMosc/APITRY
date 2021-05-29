module Repositories
    class Base
        attr_reader :adapter

        def initialize(adapter)
            @adapter = adapter
        end

        def all
            adapter.all
        end

        def find(id)
            adapter.find(id)
        end

        def create(attrs)
            adapter.create(attrs)
        end
    
        def new(attrs = nil)
            adapter.new(attrs)
        end

        def save
            adapter.save!
        end

        def delete(base)
            base.destroy
        end

    end        
end
