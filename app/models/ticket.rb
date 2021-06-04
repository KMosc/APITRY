class Ticket < ApplicationRecord
  belongs_to :ticket_desk, foreign_key: 'ticket_desk_id'
  belongs_to :cinema_hall, foreign_key: 'cinema_hall_id'
  belongs_to :movie, foreign_key: 'movie_id'

  validates_presence_of :cinema_hall
  validates_presence_of :movie
  validates :password, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates_uniqueness_of :seat, conditions: -> { where.not(movie_id: :movie_id, cinema_hall_id: :cinema_hall_id) }
  
  def exist?
    Movie.exists?(:movie_id)
  end


end
  
