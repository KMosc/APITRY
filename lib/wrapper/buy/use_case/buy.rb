module UseCase
    module Wrapper
      class Buy

        attr_reader :wrapper

        def initialize(wrapper: Wrapper::Buy.new)
          @wrapper = wrapper
        end
        
        def call(password, ticket_params, seat, cinema_hall_id, movie_id)
          @generateseats = UseCase::CinemaHalls::GenerateSeats.new(@wrapper.repository_2)
          @test = @generateseats.call(cinema_hall_id)
            if !password.blank? && seat.in?(@test)
                if (!@wrapper.repository.exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id))
                    if @wrapper.repository.ticket_available?(cinema_hall_id, movie_id)
                        if @wrapper.repository.exists?(:paid => false)  
                          @wrapper.repository.confirm_reservation(password)
                        else
                            attributes = ticket_params.clone
                            attributes[:paid] = true
                            @ticket=@wrapper.repository.new(attributes)
                            @ticket.save!
                        end
                    end
                end
            end
        end
      end
    end
  end
  