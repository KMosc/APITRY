module UseCase
    module Ticket
      class Buy < UseCase::Base
        
        def call(password,ticket_params, seat, cinema_hall_id, movie_id)
            if !password.blank? && seat.in?(UseCase::CinemaHall::GenerateSeats(CinemaHall).call(cinema_hall_id))
                if (!repository.exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id))
                    if repository.ticket_available?(cinema_hall_id, movie_id)
                        if repository.exists?(:paid => false)  
                          repository.confirm_reservation
                        else
                            attributes = ticket_params.clone
                            attributes[:paid] = true
                            @ticket=repository.new(attributes)
                            @ticket.save!
                        end
                    end
                end
            end
        end
      end
    end
  end
  