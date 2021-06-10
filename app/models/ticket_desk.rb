class TicketDesk < ApplicationRecord
    has_and_belongs_to_many :cinema_halls, inverse_of: :ticket_desk
end
