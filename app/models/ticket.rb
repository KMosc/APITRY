class Ticket < ApplicationRecord
  belongs_to :ticket_desk
  belongs_to :cinema_hall

  def initialize(id, paid, cinema_hall_id, ticket_desk_id)
    @id = id
    @paid = paid
    @cinema_hall_id = cinema_hall_id
    @available_tickets = @cinema_volume 
    @ticket_desk_id = TicketDesk.find(self.ticket_desk_id)
  end

  def ticket_id
    self.id
  end

  def ticket_paid
    self.paid
  end

  def ticket_available
    self.available_tickets
  end

  
end
