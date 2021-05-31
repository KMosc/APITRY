module UseCase
    module Wrapper
      class Buy

        attr_reader :repository
        attr_reader :repository_2

        def initialize(repository:Repository::TicketRepository.new(Ticket), repository_2: Repository::CinemaHallRepository.new(CinemaHall))
          @repository = repository
          @repository_2 = repository_2
        end
        
        def call(password, ticket_params, seat, cinema_hall_id, movie_id)
          @generateseats =UseCase::CinemaHalls::GenerateSeats.new(@repository_2)
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
  