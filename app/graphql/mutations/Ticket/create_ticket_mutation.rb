module Mutations
    class CreateTicketMutation < BaseMutation
      argument :paid, Boolean, required: true
      argument :password, String, required: true
      argument :seat, String, required: true
      argument :cinema_hall_id, ID, required: true
      argument :movie_id, ID, required: true
      argument :ticket_desk_id, ID, required: true

      def resolve(**args)
        wrapper = Buy::Decorator.new(
              Repository::TicketRepository.new, 
              Repository::CinemaHallRepository.new
              )
        use_case = UseCase::Decorator::Buy.new(wrapper, args).call
        if (TicketDesk.find(args[:ticket_desk_id]).automated == false )
          self.send_ticket_mail
          cleanup_job=TicketsAfterSeanceCleanupJob.set(wait: end_time_of(movie).seconds).perform_later(end_time_of(movie),args, args[:password], movie, args[:seat])
        else
          cleanup_job=TicketsCleanupJob.set(wait: lauching_time_of(movie).seconds).perform_later(lauching_time_of(movie),args, args[:password], movie, args[:seat])
        end
        {status: 200}
      end
      
      private

      def send_ticket_mail(**args)
        TicketMailer.with(
          password: args[:password], 
          cinema_hall_id: args[:cinema_hall_id], 
          movie_id: args[:movie_id], 
          seat: args[:seat] 
          ).mail_after_success_buy.deliver_now!
      end

      def lauching_time_of(movie)
        next_day = DateTime.now.hour+ DateTime.now.min > movie[:starts_at].hour+movie[:starts_at].min
        if next_day
          minutes_left = 24.hour - DateTime.now.hour- DateTime.now.min + movie[:starts_at].hour+movie[:starts_at].min-30.minutes
        else
          minutes_left = movie[:starts_at].hour+movie[:starts_at].min-30.minutes - DateTime.now.hour- DateTime.now.min
        end
        minutes_left
      end
      def end_time_of(movie)
        next_day = DateTime.now.hour+ DateTime.now.min > movie[:ends_at].hour+movie[:ends_at].min
        if next_day
          minutes_left = 24.hour - DateTime.now.hour- DateTime.now.min + movie[:ends_at].hour+movie[:ends_at].min
        else
          minutes_left = movie[:ends_at].hour+movie[:ends_at].min - DateTime.now.hour- DateTime.now.min
        end
        minutes_left
      end
    end
end
  