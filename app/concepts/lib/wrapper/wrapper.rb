module Buy
    class Wrapper 
        attr_reader :repository
        attr_reader :repository_2
            
        def initialize(repository, repository_2)
            @repository = repository
            @repository_2 = repository_2
    	end

        def getLeftRepository
            @repository
        end

        def getRightRepository
            @repository_2
        end
	end        
end

