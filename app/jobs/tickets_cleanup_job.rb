require 'date'

class TicketsCleanupJob < ApplicationJob
  sidekiq_options retry: false
  queue_as :tickets_cleanup_job
  def perform(nump_minute,params, password, movie, seat)
    logger.debug "Deletion ticket in #{nump_minute} minutes. Pay before that"
    if Ticket.destroy_by(password: password, movie_id: movie[:id], seat: seat)
      logger.debug "Tickets that were paid, destroyed."
      self.cancel_ticket_mail(params)
    end
  end


  private
  def cancel_ticket_mail(params)
    TicketClenupMailer.with(
      password: params[:password], 
      cinema_hall_id: params[:cinema_hall_id], 
      movie_id: params[:movie_id], 
      seat: params[:seat] 
      ).mail_cancel_reservation.deliver_now!
  end
end
