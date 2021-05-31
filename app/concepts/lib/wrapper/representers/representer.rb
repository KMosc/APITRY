  
module Decorator
  module Buy
      class Representer
        attr_reader :wrapper

    
        def initialize(wrapper)
          @wrapper = wrapper
        end
        
    
        def seats_not_taken(cinema_hall_id, movie_id)
          return {"empty_seats":
          (
            UseCase::CinemaHalls::GenerateSeats.new(
            wrapper.leftRepository
            ).call(cinema_hall_id) - UseCase::Tickets::Taken.new(
              wrapper.rightRepository
          ).call(cinema_hall_id, movie_id)
          )
        }
        end
    
    end
  end
end