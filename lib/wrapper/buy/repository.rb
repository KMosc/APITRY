module Repository
    module Wrapper
        class Buy 
            attr_reader :adapter_1
            attr_reader :adapter_2
            
        	def initialize(adapter_1: CinemaHall, adapter_2: Ticket)
                	@adapter_1 = adapter_1
                	@adapter_2 = adapter_2
    		end
		
	    end        
    end
end
