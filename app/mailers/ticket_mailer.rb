class TicketMailer < ApplicationMailer
  default from: 'kamil.mazurek319@gmail.com'

  def mail_after_success_buy
    @email = params[:password]
    @cinema_hall_id = params[:cinema_hall_id]
    @movie_id = params[:movie_id]
    @seat = params[:seat]
    title = Movie.where(id: @movie_id, cinema_hall_id: @cinema_hall_id)[1]
    mail(
      to: @email,
      subject: 'MonteCinema Payment done') do |format|
        format.text { render plain: 'You have bought a ticket for movie id: #{movie_id} on #{title} in #{@cinema_hall_id} cinema hall, seat #{@seat}.' }
      end 
  end

end
