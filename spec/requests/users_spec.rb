require 'rails_helper'

RSpec.describe "User requests" do
  describe "user registration" do
    let!(:doorkeeper) { 
        Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
        User.create!(email: "test@example.com", password: "testxtest")    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
    }

    
    it "Create user" do
      post("/users", params: {email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid})
      expect(response.status).to eq(422)
    end

    it "Log in user" do
        get("/movies", params: {Authentication: token.token, email: "test@example.com", password: "testxtest", client_id: doorkeeper.uid})
        expect(response.status).to eq(200)
      end
    
  end

end