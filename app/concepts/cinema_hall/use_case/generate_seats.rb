

module UseCase
    module CinemaHalls 
        class GenerateSeats < UseCase::Base::Base 
            def call(id)
                big_alphabet = ("A".."Z").to_a
                begin
                    @cinema_hall = repository.find_by(id) 
                    volume =  @cinema_hall.read_attribute('volume')
                    seats=1.step(volume,1).to_a
                    for i in 0..volume-1
                          seats[i] = "#{i/10+1}#{big_alphabet[i%10]}"
                    end
                rescue ActiveRecord::RecordNotFound => e
                    seats = []
                end
                return seats
            end
        end
    end
end