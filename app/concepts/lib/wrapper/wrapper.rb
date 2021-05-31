module Buy
    class Wrapper 
        attr_reader :repository
        attr_reader :repository_2
            
        def initialize(repository: Repository::TicketRepository.new(Ticket), repository_2: Repository::CinemaHallRepository.new(CinemaHall))
            @repository = repository
            @repository_2 = repository_2
    	end
	end        
end

