  
module Base
    class Representer
      attr_reader :base
  
      def initialize(base)
        @base = base
      end

  
      def single
        base.map do |out|
          out
        end
      end
    end
  end