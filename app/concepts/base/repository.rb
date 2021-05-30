module Repositories
    class Base
        attr_reader :adapter

        def initialize(adapter)
            @adapter = adapter
        end
    

        def exists?(:params)
          adapter.exists?(:params)
        end

        def all
            adapter.all
        end

        def make_reservation(ticket_params)
            if !adapter.exists?(:paid => false)  
              attributes = ticket_params.clone
              if attributes[:paid] == false
                attributes[:paid] = true
              end
              @ticket=adapter.new(attributes)
              @ticket.save!
            end
          end
      
          def update_all(:params)
            adapter.update_all(:params)
          end
          
          def confirm_reservation
            adapter.where(paid: false, password: params[:password]).update_all(paid: true)
          end
      
          def ticket_available?(cinema_hall_id, movie_id)
            obj = CinemaHall
            @cinema_hall = CinemaHall::Repositories(obj).find(cinema_hall_id)
            (adapter.where(movie_id).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume) ) 
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
