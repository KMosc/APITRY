class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :cinema_hall
end
