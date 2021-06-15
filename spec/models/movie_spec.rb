require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe 'validations' do
        let!(:cinema_hall) { 
            CinemaHall.create(volume: 100)    
          }
        let!(:genre) { 
            Genre.create(title: 'test', description: 'test')    
          }
        context 'when all params are passed' do
          it 'creates genre with valid params: {title, description}' do
            subject= Movie.create(
                title: 'test', 
                description: 'test', 
                age_restriction: 16, 
                starts_at: DateTime.now, 
                ends_at: DateTime.now, 
                cinema_hall_id: cinema_hall.id, 
                genre_id: genre.id
                )
            expect(subject).to be_valid
          end
        end
        context 'when genre not exist!' do
            it 'not valid' do
              subject= Movie.create(
                  title: 'test', 
                  description: 'test', 
                  age_restriction: 16, 
                  starts_at: DateTime.now, 
                  ends_at: DateTime.now, 
                  cinema_hall_id: cinema_hall.id, 
                  genre_id: 100
                  )
              expect(subject).to_not be_valid
            end
        end

        context 'when cinema_hall not exist!' do
            it 'not valid' do
              subject= Movie.create(
                  title: 'test', 
                  description: 'test', 
                  age_restriction: 16, 
                  starts_at: DateTime.now, 
                  ends_at: DateTime.now, 
                  cinema_hall_id: 100, 
                  genre_id: genre.id
                  )
              expect(subject).to_not be_valid
            end
        end

    end
end
