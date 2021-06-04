class TicketDesk < ApplicationRecord
    has_and_belongs_to_many :cinema_halls, inverse_of: :ticket_desk, foreign_key: 'cinema_hall_id'
    validates :name, presence: true, length: { maximum: 30 }, format: {with: /[a-zA-Z]/}
    validates :ticket_desk_id, numericality: { only_integer: true }

end
