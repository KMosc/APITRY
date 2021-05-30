module UseCase
    module Ticket
      class Taken < UseCase::Base
        def call()
          seats_taken=[]
          i = 0
          repository.all.each do |ticket|
            seats_taken[i]=ticket[:seat]
            i=i+1
          end
          return seats_taken
        end

      end
    end
  end