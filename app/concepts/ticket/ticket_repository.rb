module Repository
    class TicketRepository < ::Repository::Base
        def initialize(adapter: Ticket)
            @adapter = adapter
        end
        def where(params)
          adapter.where(params)
        end
        
        def make_reservation(ticket_params)
            if !adapter.exists?(:paid => false)  
              attributes = ticket_params.clone
              if attributes[:paid] == false
                attributes[:paid] = true
              end
              @ticket=adapter.new(attributes)
              @ticket.save!
            end
          end

          def confirm_reservation(password)
            adapter.where(paid: false, password: password).update_all(paid: true)
          end
    

    end
end