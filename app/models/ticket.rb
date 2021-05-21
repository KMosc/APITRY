class Ticket < ApplicationRecord
  belongs_to :ticket_desk
  belongs_to :cinema_hall
end
