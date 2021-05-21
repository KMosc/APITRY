class TicketDesk < ApplicationRecord
    has_and_belongs_to_many :cinema_halls
    validate :id, :if => :exist?

    def exist?
        @ticket.exists?(id: ticket_desk_id)
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
