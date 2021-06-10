
class TicketsCleanupJob < ApplicationJob
  sidekiq_options retry: false
  queue_as :tickets_cleanup_job
  def perform(password, movie)
    nump_minute = movie[:starts_at].hour*60+movie[:starts_at].min - DateTime.now.hour*60- DateTime.now.min
    logger.debug "Deletion ticket in #{nump_minute} minutes. Pay before that"
    if Ticket.where(movie_id: movie.id, password: password, paid: false).destroy_all
      logger.debug "Tickets that were paid, destroyed."
    end
  end
end
