require 'rails_helper'

RSpec.describe "Movies requests" do
  describe "GET /movies" do
    it "Fetch all movies" do
      get("/movies")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /movies" do
    let!(:genre) { Genre.create(title: "test", description: "test") }
    let!(:cinema_hall) { CinemaHall.create!(volume: 200) }
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
        User.create!(email: "test@example.com", password: "testxtest")    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
    }  
    it "Create the movies" do
      post("/movies", params: {email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid, title: "test", description: "test", age_restriction: 16, starts_at: "18:00", ends_at: "18:00", cinema_hall_id: cinema_hall.id, genre_id: genre.id})
      expect(response.status).to eq(401)
    end
  end

end