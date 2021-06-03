class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :clients, :inverse_of=>:movie
  belongs_to :cinema_hall
  validates_presence_of :cinema_hall
  validates :id, numericality: { only_integer: true }
  validate :id, :if => :exist?

end
