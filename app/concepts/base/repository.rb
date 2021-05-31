module Repositories
    class Base 
        attr_reader :adapter

        def initialize(adapter)
            @adapter = adapter
        end
    

        def exists?(params)
          @adapter.exists?(params)
        end

        def all
            adapter.all
        end

          def update_all(params)
            adapter.update_all(params)
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
      
        def find_by(id)
            adapter.find(id)
        end
    end        
end
