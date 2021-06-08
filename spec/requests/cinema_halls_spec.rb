require 'rails_helper'

RSpec.describe "Movies requests" do
  let!(:doorkeeper) { 
    Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
  }
  let!(:user) { 
      User.create!(email: "test@example.com", password: "testxtest")    
  }
  let!(:token) { 
      Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
  }  
  describe "GET /cinema_halls" do
    it "Fetch all cinema_halls" do
      get("/cinema_halls", params: {email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid})
      expect(response.status).to eq(200)
    end
  end
  describe "POST /cinema_halls" do

    it "Create the cinema_halls" do
      post("/cinema_halls", params: {email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid, volume: 200})
      expect(response.status).to eq(401)
    end
  end

end