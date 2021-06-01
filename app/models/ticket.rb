class Ticket < ApplicationRecord
  belongs_to :ticket_desk
  belongs_to :cinema_hall
  belongs_to :movie
  validates :ticket_desk_id, numericality: { only_integer: true }
  validates :cinema_hall_id, numericality: { only_integer: true }
  validates :movie_id, numericality: { only_integer: true }
  validates_uniqueness_of :seat, conditions: -> { where.not(movie_id: :movie_id, cinema_hall_id: :cinema_hall_id) }

end
  
