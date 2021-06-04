class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :clients, :inverse_of=>:movie
  belongs_to :cinema_hall
  validates_presence_of :cinema_hall
  validates :id, :presence => true, :if => :exist?


  def exist?
    Genre.exists?(:movie_id)
  end

end
