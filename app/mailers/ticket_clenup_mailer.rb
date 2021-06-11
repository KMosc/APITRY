class TicketClenupMailer < ApplicationMailer
    default from: 'kamil.mazurek319@gmail.com'
    
    def mail_cancel_reservation
      email = params[:password]
      cinema_hall_id = params[:cinema_hall_id].to_s
      movie_id = params[:movie_id].to_s
      seat = params[:seat].to_s
      text = 'You have discarded a ticket for movie id #{movie_id} in cinema hall #{cinema_hall_id} at #{seat} seat number.'
      mail(
        to: email,
        subject: 'MonteCinema reservation cancelled by system.') do |format|
          format.text { render html: text }
        end 
    end  
end
