class TicketDesk < ApplicationRecord
    has_many :tickets, :class_name => 'TicketDesk', :foreign_key => 'cinema_hall_id'
    def initialize(id,name, automated)
        @id = id
        @name = name
        @automated = automated
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
