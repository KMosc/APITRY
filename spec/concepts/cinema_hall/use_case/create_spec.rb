RSpec.describe  do
    let(:repository) { Repository::CinemaHallRepository.new() }
    
    subject { UseCase::CinemaHalls::Create.new(repository).call(volume: 100) }
    describe '.call' do
        it 'creates cinema_hall with valid params' do
            expect(subject).to be_a_kind_of(CinemaHall)

        end
    end
end
