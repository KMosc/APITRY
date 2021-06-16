require 'rails_helper'
require 'faker'

RSpec.describe "Ticket requests" do
  describe "operation on/tickets" do
    let!(:genre) { 
      Genre.create(title: "test", description: "test") 
    }
    let!(:cinema_hall) { 
      CinemaHall.create!(volume: 200) 
    }
    let!(:movie) { 
      Movie.create!(title: "test", description: "test", age_restriction: 16, starts_at: "18:00", ends_at: "18:00", cinema_hall_id: cinema_hall.id, genre_id: genre.id)
    }
    let!(:ticket_desks){ 
      TicketDesk.create(
            name: 'test',
            automated: true
              )
     }

  let!(:doorkeeper) { 
    Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
  }
  let!(:user) { 
    User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))    
  }
  let!(:token) { 
      Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
  }    
    it "Fetch all empty seats" do
      get("/movies/#{movie.id}/ticket", params: {cinema_hall_id: cinema_hall.id})
      expect(response.status).to eq(200)
    end

    it "Create the tickets" do
      post("/ticket_desks/#{ticket_desks.id}/movies/#{movie.id}/ticket", params: {password: user.password, seat: "1B", movie_id: movie.id, cinema_hall_id: cinema_hall.id})
      expect(response.status).to eq(401)
    end
  end

end