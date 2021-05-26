class TicketDesk < ApplicationRecord
    has_and_belongs_to_many :cinema_halls
    validates :name, presence: true, length: { maximum: 30 }, format: {with: /[a-zA-Z]/}


    def exist?
        TicketDesk.exists?(id: self.ticket_desk_id)
    end
    def ticket_desk_id
        self.id
    end
    def ticket_desk_name
        self.name
    end
    def ticket_desk_automated
        self.automated
    end
end
