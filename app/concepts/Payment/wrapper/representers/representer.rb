  
module Decorator
  module Buy
      class Representer
        attr_reader :wrapper

    
        def initialize(wrapper)
          @wrapper = wrapper
        end
        
    
        def seats_not_taken(params)
          return {"empty_seats":
          (
            cinema_matrix_representation=UseCase::CinemaHalls::GenerateSeats.new(wrapper.left_Repository).call(params[:cinema_hall_id]) 
            seats_taken_in_cinema=UseCase::Tickets::Taken.new(wrapper.right_Repository).call(params)
            cinema_matrix_representation-seats_taken_in_cinema
          )
          }
        end
      end
  end
end