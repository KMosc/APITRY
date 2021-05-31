module Buy
    class Wrapper 
        attr_reader :leftRepository
        attr_reader :rightRepository
            
        def initialize(leftRepository, rightRepository)
            @leftRepository = leftRepository
            @rightRepository = rightRepository
    	end

        def getLeftRepository
            @leftRepository
        end

        def getRightRepository
            @rightRepository
        end
	end        
end

