require 'rails_helper'

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
    
    it "Fetch all empty seats" do
      get("/movies/#{movie.id}/ticket", params: {cinema_hall_id: cinema_hall.id})
      expect(response.status).to eq(200)
    end

    it "Create the tickets" do
      post("/movies/#{movie.id}/ticket", params: {password: "email@email.com", seat: "1B", movie_id: movie.id, cinema_hall_id: cinema_hall.id})
      expect(response.status).to eq(200)
    end
  end

end