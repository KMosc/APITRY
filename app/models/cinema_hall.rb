class CinemaHall < ApplicationRecord
has_many :tickets, :class_name => 'CinemaHall', :foreign_key => 'ticket_id'

def initialize(id,volume)
    @id = id
    @volume = volume
  end

def cinema_hall_id
    self.id
end
def cinema_volume
    self.volume
end

end
