module Buy
    class Decorator 
        attr_reader :left_Repository
        attr_reader :right_Repository
            
        def initialize(left_Repository, right_Repository)
            @left_Repository = left_Repository
            @right_Repository = right_Repository
    	end
	end        
end

