class TicketMailer < ApplicationMailer
  default from: 'kamil.mazurek319@gmail.com'

  def mail_after_success_buy
    email = params[:password]
    cinema_hall_id = params[:cinema_hall_id].to_s
    movie_id = params[:movie_id].to_s
    seat = params[:seat].to_s
    text = "You have bought a ticket for movie id: #{movie_id} in cinema_hall #{cinema_hall_id} with seat taken #{seat}"
    mail(
      to: email,
      subject: 'MonteCinema Payment done') do |format|
        format.text { render html: text }
      end 
  end

end
