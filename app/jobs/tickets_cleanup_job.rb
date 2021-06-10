
class TicketsCleanupJob < ApplicationJob
  sidekiq_options retry: false
  queue_as :tickets_cleanup_job
  def perform(password, movie_id)

    if Ticket.find(password: password, paid: false, movie_id: movie_id)
      Ticket.where(movie_id: movie_id, password: password, paid: false).destroy_all
      logger.debug "Tickets that were paid, destroyed."
    end
    logger.debug "There are no tickets to be destroyed."

  end
end
