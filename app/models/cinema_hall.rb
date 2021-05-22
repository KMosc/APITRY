class CinemaHall < ApplicationRecord
has_and_belongs_to_many :tickets

validate :id, :if => :exist?



def cinema_hall_id
    self.id
end
def exist?
    @cinema_hall.exists?(id: cinema_hall_id)
end
def cinema_volume
    self.volume
end

end
