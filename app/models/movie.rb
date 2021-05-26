class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :clients

  belongs_to :cinema_hall
end
