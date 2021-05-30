module UseCase
    module Ticket
      class Buy < UseCase::Base
        
        def call(password,ticket_params, seat, cinema_hall_id, movie_id)
            if !password.blank? && seat.in?(UseCase::CinemaHall::GenerateSeats.call(cinema_hall_id))
                if (!repository(Ticket).exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id))
                    if repository(Ticket).ticket_available?(cinema_hall_id, movie_id)
                        if repository(Ticket).exists?(:paid => false)  
                          repository(Ticket).confirm_reservation
                        else
                            attributes = ticket_params.clone
                            attributes[:paid] = true
                            @ticket=repository(Ticket).new(attributes)
                            @ticket.save!
                        end
                    end
                end
            end
        end
      end
    end
  end
  