class TicketMailer < ApplicationMailer
  default from: 'notifications@montecinema.com'

  def buy
    @title = params[:title]
    @id = params[:cid]
    @startT = params[:start]
    @endT = params [:endt]
    @email = params[:email]
    mail(to: @email, subject: 'You have bought a ticket for #{@title} in #{@id} cinema hall. It starts #{@startT} and ends #{@endT}')
  end

end
