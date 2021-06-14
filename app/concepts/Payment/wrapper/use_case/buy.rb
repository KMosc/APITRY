module UseCase
  module Decorator
    class Buy
      attr_reader :wrapper

      def initialize(wrapper, ticket_params)
        @wrapper = wrapper
        @ticket_params = ticket_params
      end
       # create payment
      def call
        if validate?
          payment
        end
      end
    
    private
    def available_seats
      no_seats=UseCase::CinemaHalls::GenerateSeats.new(@wrapper.right_Repository).call(@ticket_params[:cinema_hall_id])
      taken_seats=UseCase::Tickets::Taken.new(@wrapper.left_Repository).call(@ticket_params)
      return no_seats-taken_seats
    end

    def validate?
      seats_nil_tickets = available_seats()
      !@ticket_params[:password].blank? && @ticket_params[:seat].in?(seats_nil_tickets) && seats_nil_tickets.count > 0
    end

    #payment succed, ticket create
    def payment
        attributes = @ticket_params.clone
        @ticket= wrapper.left_Repository.create(attributes)
    end
  end
  end
end

      
