module UseCase
    module Tickets
      class Taken < UseCase::Base::Base
        # What tickets were taken for movie in cinema hall
        def call(params)
          seats_taken=[]
          i = 0
          find = repository.where(cinema_hall_id: params[:cinema_hall_id], movie_id: params[:movie_id]).each do |ticket|
            seats_taken.push(ticket[:seat])
            i=i+1
          end    
          return seats_taken    
        end
      end
    end
  end