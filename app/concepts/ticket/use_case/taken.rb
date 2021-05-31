module UseCase
    module Tickets
      class Taken < UseCase::Base::Base

        def call
          repository.all.each_with_index.map { 
            |ticket, index| [index, ticket[:seat]] }
        end

      end
    end
  end