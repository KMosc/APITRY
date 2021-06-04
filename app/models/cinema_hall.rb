class CinemaHall < ApplicationRecord
has_and_belongs_to_many :movies, inverse_of: :cinema_hall
has_and_belongs_to_many :tickets, inverse_of: :cinema_hall, foreign_key: 'ticket_id'
validates :movie_id, presence: true, if: :exist?
validates :volume, numericality: { less_than_or_equal_to: 200,  only_integer: true }


def cinema_hall_id
    self.id
end
def exist?
    CinemaHall.find_by(:cinema_hall_id)
end
def cinema_volume
    self.volume
end

end
