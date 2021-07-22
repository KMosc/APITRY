module Repository
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

        def update(params)
            obj = adapter.find(params[:id])
            obj.update(params)
        end

        def create(attrs)
            begin
                adapter.create(attrs)
            rescue ActiveRecord::RecordInvalid => error
                ["Error": "NotFound"]
            end
        end
    
        def new(attrs = nil)
            adapter.new(attrs)
        end

        def save
            adapter.save!
        end

        def delete(param)
            adapter.delete_by(param)
        end
      
        def find_by(id)
            adapter.find(id)
        end
    end        
end
