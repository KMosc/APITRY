require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let!(:ticket_desk) { 
        TicketDesk.create(
            name: 'test',
            automated: true
            )    
      }
    let!(:cinema_hall) { 
        CinemaHall.create(
            volume: 100
            )    
      }
    let!(:genre) { 
      Genre.create(
          title: 100, 
          description: 'test'
          )
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
    context 'when ticket with not existing movie' do
      it 'not valid' do
        subject= Ticket.create(
            paid:  true, 
            password: 'test@test.com', 
            seat: "1B", 
            ticket_desk_id: ticket_desk.id,
            cinema_hall_id: cinema_hall.id,
            movie_id: movie.id
            )
        expect(subject).to be_valid
      end
    end
    context 'when ticket with not existing movie' do
        it 'not valid' do
          subject= Ticket.create(
              paid:  true, 
              password: 'test@test.com', 
              seat: "1B", 
              ticket_desk_id: ticket_desk.id,
              cinema_hall_id: cinema_hall.id,
              movie_id: 100
              )
          expect(subject).to_not be_valid
        end
      end
      context 'when cinema_hall, ticket_desk and movie not existing' do
        it 'not valid' do
          subject= Ticket.create(
              paid:  true, 
              password: 'test@test.com', 
              seat: "1B", 
              ticket_desk_id: nil,
              cinema_hall_id: nil,
              movie_id: nil
              )
          expect(subject).to_not be_valid
        end
      end

      context 'password is not email' do
        it 'not valid' do
          subject= Ticket.create(
              paid:  true, 
              password: 'test', 
              seat: "1B", 
              ticket_desk_id: ticket_desk.id,
              cinema_hall_id: cinema_hall.id,
              movie_id: movie.id
              )
          expect(subject).to_not be_valid
        end
      end

end
