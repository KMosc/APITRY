class Ticket < ApplicationRecord
  belongs_to :ticket_desk, foreign_key: 'ticket_desk_id'
  belongs_to :cinema_hall, foreign_key: 'cinema_hall_id'
  belongs_to :movie, foreign_key: 'movie_id'

  validates_presence_of :cinema_hall
  validates_presence_of :movie
  validates :id, presence: true, if: :exist?
  validates :password, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates_uniqueness_of :seat, conditions: -> { where.not(movie_id: :movie_id, cinema_hall_id: :cinema_hall_id) }
  
  def exist?
    Movie.where(id: -1).nil? && CinemaHall.where(cinema_hall_id: -1).nil?
  end


end
  
