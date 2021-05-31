  
module Wrapper
  module Buy
      class Representer
        attr_reader :base
    
        def initialize(base)
          @base = base
        end

    
        def single
          @base
        end
      end
    end
  end
end
