require 'rails_helper'

RSpec.describe "Movies requests" do
  describe "GET /Genres" do
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
        User.create!(email: "test@example.com", password: "testxtest")    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
    }  
    it "Fetch all genre" do
      get("/genre")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /genres" do
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
      post("/genre", params: {email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid, title: "test", description: "test"})
      expect(response.status).to eq(401)
    end
  end

end