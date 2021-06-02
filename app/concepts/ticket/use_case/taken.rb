module UseCase
    module Tickets
      class Taken < UseCase::Base::Base
        def call(id, cinema_hall_id, movie_id)
          seats_taken=[]
          i = 0
          repository.all.where(id: id, cinema_hall_id: cinema_hall_id, movie_id: movie_id).each do |ticket|
            seats_taken[i]=ticket[:seat]
            i=i+1
          end
          return seats_taken        
        end
      end
    end
  end