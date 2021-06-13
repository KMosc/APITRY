module UseCase
  module Decorator
    class Buy
      attr_reader :wrapper

      def initialize(wrapper)
        @wrapper = wrapper
      end
       # create payment
      def call(id,password, ticket_params)
        left = @wrapper.left_Repository
        right = @wrapper.right_Repository
        if validate?(id,ticket_params[:password], left, right, ticket_params[:seat], ticket_params)
          payment(left, ticket_params, ticket_params[:cinema_hall_id], ticket_params[:seat], ticket_params[:movie_id])
        end
      end
    
    private
    def available_seats(left_Repository, right_Repository, params)
      UseCase::CinemaHalls::GenerateSeats.new(right_Repository).call(params[:cinema_hall_id]) - UseCase::Tickets::Taken.new(left_Repository).call(params)
    end

    def validate?(id,email, left_Repository, right_Repository, seat, params)
      seats_nil_tickets = available_seats(left_Repository, right_Repository, params)
      !email.blank? && seat.in?(seats_nil_tickets) && seats_nil_tickets.count > 0
    end

    #payment succed, ticket create
    def payment(left, ticket_params, cinema_hall_id, seat, movie_id)
        attributes = ticket_params.clone
        @ticket= left.create(attributes)
    end
  end
  end
end

      
