  
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
            left=UseCase::CinemaHalls::GenerateSeats.new(wrapper.left_Repository).call(params[:cinema_hall_id]) 
            right=UseCase::Tickets::Taken.new(wrapper.right_Repository).call(params)
            left-right
          )
          }
        end
      end
  end
end