module UseCase
    module Decorator
      class Buy

        attr_reader :wrapper

        def initialize(wrapper)
          @wrapper = wrapper
        end
        
        def call(password, ticket_params, seat, cinema_hall_id, movie_id)
          left = @wrapper.getLeftRepository
          right = @wrapper.getRightRepository
          @generateseats = UseCase::CinemaHalls::GenerateSeats.new(right)
          @test = @generateseats.call(cinema_hall_id)
            if !password.blank? && seat.in?(@test)
                if (!left.exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id))
                    if left.ticket_available?(cinema_hall_id, movie_id)
                        if left.exists?(:paid => false)  
                          left.confirm_reservation(password)
                        else
                            attributes = ticket_params.clone
                            attributes[:paid] = true
                            @ticket= left.new(attributes)
                            @ticket.save!
                        end
                    end
                end
            end
        end
      end
    end
  end
  