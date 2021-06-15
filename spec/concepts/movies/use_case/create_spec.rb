RSpec.describe  do
    let(:repository) { Repository::MovieRepository.new() }
    let!(:cinema_hall) { 
        CinemaHall.create(volume: 100)    
      }
    let!(:genre) { 
        Genre.create(title: 'test', description: 'test')    
      }
    subject { UseCase::Movies::Create.new(repository).call(
        title: 'test', 
        description: 'test', 
        age_restriction: 16, 
        starts_at: DateTime.now, 
        ends_at: DateTime.now, 
        cinema_hall_id: cinema_hall.id, 
        genre_id: genre.id
        ) }
    describe '.call' do
        it 'creates ticket_desk with valid params' do
            expect(subject).to be_a_kind_of(Movie)

        end
    end
end
