  
module Wrapper
  module Buy
      class Representer
        attr_reader :repository
        attr_reader :repository_2

    
        def initialize(repository: Repository::CinemaHallRepository.new(CinemaHall), repository_2:Repository::TicketRepository.new(Ticket))
          @repository = repository
          @repository_2 = repository_2
        end
        
    
        def seats_not_taken(cinema_hall_id, movie_id)
          return {"empty_seats":
          (
            UseCase::CinemaHalls::GenerateSeats.new(
              repository
            ).call(cinema_hall_id) - UseCase::Tickets::Taken.new(
              repository_2
          ).call(cinema_hall_id, movie_id)
          )
        }
        end

    
    end
  end
end













  
module Tickets
  class Representer  < ::Base::Representer
    
    def seats_not_taken(cinema_hall_id, movie_id)
      return {"empty_seats":
      (
        UseCase::CinemaHalls::GenerateSeats.new(
          Repository::CinemaHallRepository.new(CinemaHall)
        ).call(cinema_hall_id) - UseCase::Tickets::Taken.new(
          Repository::TicketRepository.new(Ticket)
      ).call(cinema_hall_id, movie_id)
      )
    }
    end

  end

end