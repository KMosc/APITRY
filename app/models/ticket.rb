class Ticket < ApplicationRecord
  belongs_to :cinema_hall
  validate :id, :if => :exist?
  validates :ticket_desk_id, numericality: { only_integer: true }
  validates :cinema_hall_id, numericality: { only_integer: true }
  validates :paid, presence: true, inclusion: { in: [true, false] }


  def exist?
      Ticket.exists?(id: self.ticket_id)
  end

  def ticket_id
    self.id
  end

  def ticket_paid
    self.paid
  end


  
end
