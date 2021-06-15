RSpec.describe "CinemaHall concept generate seats" do
    let(:repository) { Repository::CinemaHallRepository.new() }
    let(:cinema_hall) { 
        repository=Repository::CinemaHallRepository.new()
        UseCase::CinemaHalls::Create.new(repository).call(volume: 100) 
    }
    subject { UseCase::CinemaHalls::GenerateSeats.new(repository).call(cinema_hall.id) }
    describe '.call' do
        it 'creates cinema_hall matrix representation' do
            expect(subject).to be_a_kind_of(Array)

        end
    end
end
