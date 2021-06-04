

module UseCase
    module CinemaHalls 
        class GenerateSeats < UseCase::Base::Base 
            def call(id)
                begin
                    cinema_hall = repository.find_by(id) 
                    volume = cinema_hall.volume
                    seats = cinema_matrix_representation(volume)
                rescue ActiveRecord::RecordNotFound => e
                end
                return seats
            end

            private
            def cinema_matrix_representation(volume)
                seats=(1..volume).to_a
                seats.map.with_index do |seat, index|
                    seats[index] = "#{index/10+1}#{alphabet[index%10]}"
                end
            end
            def alphabet
                ("A".."Z").to_a
            end

        end
    end
end