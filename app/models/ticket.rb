class Ticket < ApplicationRecord
  belongs_to :cinema_hall


  def ticket_id
    self.id
  end

  def ticket_paid
    self.paid
  end



  def ticket_available?
      self.count != CinemaHall.where([id: params[:cinema_hall_id]]).volume
  end
  def route_availabe?
    !TicketDesk.exists?(id: params[:ticket_desk_id]) && !CinemaHall.exists?(id: params[:cinema_hall_id])
  end

  
end
