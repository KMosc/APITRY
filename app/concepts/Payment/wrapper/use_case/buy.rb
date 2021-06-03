module UseCase
    module Decorator
      class Buy

        attr_reader :wrapper

        def initialize(wrapper)
          @wrapper = wrapper
        end

        def call(id,password, ticket_params, seat, cinema_hall_id, movie_id)
          left = @wrapper.getLeftRepository
          right = @wrapper.getRightRepository
          if validate?(id,password, left, right, seat,cinema_hall_id, movie_id)
            payment(left,ticket_params, cinema_hall_id, seat, movie_id)
          end
        end
    
    private

    def validate?(id,password, left_Repository, right_Repository, seat, cinema_hall_id, movie_id)
      @available_seats = UseCase::CinemaHalls::GenerateSeats.new(right_Repository).call(cinema_hall_id)
      @hidden_seats = UseCase::Tickets::Taken.new(left_Repository).call(id, cinema_hall_id, movie_id)
      !password.blank? && seat.in?(@available_seats) && !seat.in?(@hidden_seats)
    end

    def payment(left, ticket_params, cinema_hall_id, seat, movie_id)
        attributes = ticket_params.clone
        attributes[:paid] = true
        @ticket= left.new(attributes).save!
    end

    end
  end
end

      

  