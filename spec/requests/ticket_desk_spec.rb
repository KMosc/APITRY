require 'rails_helper'

RSpec.describe "Ticket Desks"
  describe "Fetch ticket desks" do
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: "Android client", redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
        User.create!(email: "test@example.com", password: "testxtest")    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create! :application_id => doorkeeper.id, :resource_owner_id => user.id 
    }    
    it 'works and return status 200' do
      get("/ticket_desks")
      expect(response.status).to eq(200)
    end
end
