require 'rails_helper'
require 'faker'

RSpec.describe "Movies requests" do
  
  let!(:doorkeeper) { 
    Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
  }
  let!(:user) { 
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10))    
  }
  let!(:token) { 
      Doorkeeper::AccessToken.create!(application_id: doorkeeper.id, resource_owner_id: user.id)
  }  
  describe "GET /cinema_halls" do
    it "Fetch all cinema_halls" do
      get("/cinema_halls")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /cinema_halls" do

    it "Create the cinema_halls" do
      post("/cinema_halls", params: {email: user.email, password: user.password, client_id: doorkeeper.uid, volume: Faker::Number.number(digits: 2)})
      expect(response.status).to eq(401)
    end
  end

end