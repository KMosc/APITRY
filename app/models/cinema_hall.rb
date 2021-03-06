class CinemaHall < ApplicationRecord
has_and_belongs_to_many :movies, inverse_of: :cinema_hall, foreign_key: 'movie_id'
has_and_belongs_to_many :tickets, inverse_of: :cinema_hall, foreign_key: 'ticket_id'
validates :volume, numericality: { less_than_or_equal_to: 200,  only_integer: true }


end
