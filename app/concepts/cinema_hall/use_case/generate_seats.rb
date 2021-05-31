

module UseCase
    module CinemaHalls 
        class GenerateSeats < UseCase::Base::Base 
            def call(id)
                big_alphabet = ("A".."Z").to_a
                @cinema_hall = UseCase::CinemaHalls::FindX.new(repository)
                volume =  @cinema_hall.call(id).read_attribute('volume')
                seats=1.step(volume,1).to_a
                for i in 0..volume-1
                      seats[i] = "#{i/10+1}#{big_alphabet[i%10]}"
                end
                return seats
            end
        end
    end
end