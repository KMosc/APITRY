  
module Tickets
    class Representer  < ::Base::Representer
      
      def seats_not_taken(cinema_hall_id)
        return {"empty_seats":
        (
        UseCase::CinemaHalls::GenerateSeats.new(
          Repositories::CinemaHallRepository.new(CinemaHall)
        ).call(cinema_hall_id) - (
          UseCase::Tickets::Taken.new(
            Repositories::TicketRepository.new(Ticket)
        ).call)
        )
      }
      end

    end

  end