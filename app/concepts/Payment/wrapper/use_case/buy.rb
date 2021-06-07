module UseCase
    module Decorator
      class Buy

        attr_reader :wrapper

        def initialize(wrapper)
          @wrapper = wrapper
        end

        def call(id,password, ticket_params)
          left = @wrapper.left_Repository
          right = @wrapper.right_Repository
          if validate?(id,ticket_params[:password], left, right, ticket_params[:seat], ticket_params)
            payment(left, ticket_params, ticket_params[:cinema_hall_id], ticket_params[:seat], ticket_params[:movie_id])
          end
        end
    
    private

    def validate?(id,password, left_Repository, right_Repository, seat, params)
      available_seats = UseCase::CinemaHalls::GenerateSeats.new(right_Repository).call(params[:cinema_hall_id]) - UseCase::Tickets::Taken.new(left_Repository).call(params)
      !password.blank? && seat.in?(available_seats) && available_seats.count > 0
    end

    def payment(left, ticket_params, cinema_hall_id, seat, movie_id)
        attributes = ticket_params.clone
        attributes[:paid] = true
        @ticket= left.create(attributes)
    end

    end
  end
end

      

