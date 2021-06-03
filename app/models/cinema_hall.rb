class CinemaHall < ApplicationRecord
has_and_belongs_to_many :tickets, :inverse_of=>:cinema_hall

validates :id, numericality: { only_integer: true }
validate :id, :if => :exist?
validates :volume, numericality: { less_than_or_equal_to: 200,  only_integer: true }


def cinema_hall_id
    self.id
end
def exist?
    CinemaHall.exists?(id: cinema_hall_id)
end
def cinema_volume
    self.volume
end

end
