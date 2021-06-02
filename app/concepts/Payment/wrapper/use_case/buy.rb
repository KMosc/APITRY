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
            success(left,ticket_params)
          end
        end
    
    private

    def validate?(id,password, left_Repository, right_Repository, seat, cinema_hall_id, movie_id)
      @generateseats = UseCase::CinemaHalls::GenerateSeats.new(right_Repository).call(cinema_hall_id)
      !password.blank? && left_Repository.where(id: id, cinema_hall_id: cinema_hall_id, movie_id: movie_id) && seat.in?(@generateseats) && (!left_Repository.exists?(:cinema_hall_id => cinema_hall_id, seat: seat, movie_id: movie_id)) && left_Repository.ticket_available?(cinema_hall_id, movie_id)
    end

    def success(left, ticket_params)
      unless left.exists?(:paid => false)  
          attributes = ticket_params.clone
          attributes[:paid] = true
          @ticket= left.new(attributes).save!
        else
          left.confirm_reservation(password)
      end
    end

    end
  end
end

      

  