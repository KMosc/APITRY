require 'date'

class TicketsCleanupJob < ApplicationJob
  sidekiq_options retry: false
  queue_as :tickets_cleanup_job

  def perform(minutes_left,params, password, movie, seat)
    logger.debug "Deletion ticket in #{minutes_left} minutes. Pay before that"
    if Ticket.destroy_by(password: password, movie_id: movie[:id], seat: seat)
      PaymentHistory.create!(email: password, seat: seat, starts_at: starts_at, ends_at: ends_at, movie_id: movie[:id])
      logger.debug "Tickets that were not paid, destroyed."
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
