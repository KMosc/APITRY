class TicketDesk < ApplicationRecord
    has_and_belongs_to_many :cinema_halls
    validates :name, presence: true, length: { maximum: 30 }, format: {with: /[a-zA-Z]/}
end
