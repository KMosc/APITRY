

module UseCase
    module CinemaHall 
        class GenerateSeats < UseCase::Base
            def call(:id)
                big_alphabet = ("A".."Z").to_a
                volume = repository.find(id).read_attribute('volume')
                seats=1.step(volume,1).to_a
                for i in 0..volume-1
                      seats[i] = "#{i/10+1}#{big_alphabet[i%10]}"
                end
                return seats
            end
        end
    end
end