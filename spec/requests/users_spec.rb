require 'rails_helper'
require 'faker'

RSpec.describe "User requests" do
  describe "user registration" do
    let!(:doorkeeper) { 
        Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
    }

    
    it "Create user" do
      post("/users", params: {email: user.email, password: user.password, client_id: doorkeeper.uid})
      expect(response.status).to eq(422)
    end

    
  end

end