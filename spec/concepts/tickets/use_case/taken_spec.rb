require 'rails_helper'

RSpec.describe "Ticket taken create" do
    let!(:cinema_hall) { 
        CinemaHall.create(volume: 100)    
      }
    let!(:genre) { 
        Genre.create(title: 'test', description: 'test')    
      }
    let!(:movie) { UseCase::Movies::Create.new(
        Repository::MovieRepository.new()
    ).call(
        title: 'test', 
        description: 'test', 
        age_restriction: 16, 
        starts_at: DateTime.now, 
        ends_at: DateTime.now, 
        cinema_hall_id: cinema_hall.id, 
        genre_id: genre.id
        ) }
    let(:repository) { Repository::TicketRepository.new() }
    let(:params) do
        {
          cinema_hall_id: cinema_hall.id,
          movie_id: movie_id,
          seat: "1A"
        }
    subject { UseCase::Tickets::Taken.new(repository).call(params) }
    describe '.call' do
        it 'creates taken tickets ' do
            expect(subject).to be_a_kind_of(Array)
        end
    end
end
end