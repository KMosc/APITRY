module Repository
    module Wrapper
        class Buy 
            attr_reader :adapter_1
            attr_reader :adapter_2
            
        def initialize(adapter_1, adapter_2)
                @adapter_1 = adapter_1
                @adapter_2 = adapter_2
        end
        

            def exists?(adapter, params)
            adapter.exists?(params)
            end

            def all(adapter)
                adapter.all
            end

            def update_all(adapter, params)
                adapter.update_all(params)
            end

            def create(adapter, attrs)
                adapter.create(attrs)
            end
        
            def new(adapter, attrs = nil)
                adapter.new(attrs)
            end

            def save(adapter)
                adapter.save!
            end

            def delete(base)
                base.destroy
            end
        
            def find_by(adapter, id)
                adapter.find(id)
            end
        end        
    end
end
