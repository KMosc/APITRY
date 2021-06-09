require 'rails_helper'
require 'faker'

RSpec.describe "Movies requests" do
  describe "GET /Genres" do
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: Faker::Lorem.sentence, redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create!(application_id: doorkeeper.id, :resource_owner_id => user.id)
    }  
    it "Fetch all genre" do
      get("/genre")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /genres" do
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: Faker::Lorem.sentence, redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create!(application_id: doorkeeper.id, resource_owner_id: user.id)
    }  
    it "Create the movies" do
      post("/genre", params: {email: user.email, password: user.password, client_id: doorkeeper.uid, title: Faker::Company.name , description: Faker::Lorem.sentence})
      expect(response.status).to eq(401)
    end
  end

end