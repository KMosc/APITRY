class Ticket < ApplicationRecord
  belongs_to :cinema_hall


  def ticket_id
    self.id
  end

  def ticket_paid
    self.paid
  end



  def ticket_available?
    self.available_tickets
  end

  
end
