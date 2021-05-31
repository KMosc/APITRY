module UseCase
    module Tickets
      class Buy < UseCase::Base::Base
        
        def call(password, ticket_params, seat, cinema_hall_id, movie_id)
          @cinemahallrepo=Repository::CinemaHallRepository.new(CinemaHall)
          @generateseats =UseCase::CinemaHalls::GenerateSeats.new(@cinemahallrepo)
          @test = @generateseats.call(cinema_hall_id)
            if !password.blank? && seat.in?(@test)
                if (!repository.exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id))
                    if repository.ticket_available?(cinema_hall_id, movie_id)
                        if repository.exists?(:paid => false)  
                          repository.confirm_reservation(password)
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
  