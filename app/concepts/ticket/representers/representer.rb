  
module Tickets
    class Representer  < ::Base::Representer
      
      def error
        ["log": "Error"]
      end

      def success
        ["log": "success"]
      end

    end

  end