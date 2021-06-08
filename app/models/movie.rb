class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :cinema_hall, foreign_key: 'cinema_hall_id'
  has_and_belongs_to_many :tickets, inverse_of: :movie, foreign_key: 'movie_id'
  validates_presence_of :cinema_hall
  
end
