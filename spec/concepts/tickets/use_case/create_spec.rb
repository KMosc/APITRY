RSpec.describe "Ticket concept create" do
    let(:repository) { Repository::TicketRepository.new() }
    let!(:cinema_hall) { 
        CinemaHall.create(volume: 100)    
      }
    let!(:ticket_desk) { 
        TicketDesk.create(
            name: 'test',
            automated: true
            )    
      }
    let!(:genre) { 
        Genre.create(title: 'test', description: 'test')    
      }
    let!(:movie) { 
        Movie.create(
        title: 'test', 
        description: 'test', 
        age_restriction: 16, 
        starts_at: DateTime.now, 
        ends_at: DateTime.now, 
        cinema_hall_id: cinema_hall.id, 
        genre_id: genre.id
        )
     }
    subject { UseCase::Tickets::Create.new(repository).call(
        paid: true,
        password: "test@test.com",
        seat: "1B",
        ticket_desk_id: ticket_desk.id,
        cinema_hall_id: cinema_hall.id,
        movie_id: movie.id
        ) 
    }
    describe '.call' do
        it 'creates ticket_desk with valid params' do
            expect(subject).to be_a_kind_of(Ticket)

        end
    end
end
