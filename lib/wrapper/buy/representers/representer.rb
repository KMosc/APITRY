  
module Wrapper
  module Buy
      class Representer
        attr_reader :wrapper

    
        def initialize(wrapper: Wrapper::Buy.new)
          @wrapper = wrapper
        end
        
    
        def seats_not_taken(cinema_hall_id, movie_id)
          return {"empty_seats":
          (
            UseCase::CinemaHalls::GenerateSeats.new(
              wrapper.repository_2
            ).call(cinema_hall_id) - UseCase::Tickets::Taken.new(
              wrapper.repository
          ).call(cinema_hall_id, movie_id)
          )
        }
        end

    
    end
  end
end