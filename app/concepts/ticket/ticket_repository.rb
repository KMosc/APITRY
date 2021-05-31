module Repositories
    class TicketRepository < ::Repositories::Base

        def where(params)
          adapter.where(params)
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

          def confirm_reservation(password)
            adapter.where(paid: false, password: password).update_all(paid: true)
          end
      
          def ticket_available?(cinema_hall_id, movie_id)
            obj = CinemaHall
            @cinema_hall = Repositories::CinemaHallRepository.new(obj).find_by(cinema_hall_id)
            (adapter.where(movie_id: movie_id).count(:all) < @cinema_hall.read_attribute_before_type_cast(:volume) ) 
          end

    end
end