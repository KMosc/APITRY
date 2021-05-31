module UseCase
    module Tickets
      class Taken < UseCase::Base::Base
        def call(cinema_hall_id, movie_id)
          return repository.where(cinema_hall_id: cinema_hall_id, movie_id: movie_id).all.each_with_index.map { |ticket, index| [index, ticket[:seat]] }[0]
        end
      end
    end
  end