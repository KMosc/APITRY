require 'rails_helper'
require 'faker'

RSpec.describe "Ticket Desks"
  describe "Fetch ticket desks" do
    let!(:doorkeeper) { 
      Doorkeeper::Application.create!(name: Faker::Lorem.sentence, redirect_uri: "", scopes: "")    
    }
    let!(:user) { 
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))    
    }
    let!(:token) { 
        Doorkeeper::AccessToken.create!(application_id: doorkeeper.id, resource_owner_id: user.id)
    }    
    it 'works and return status 200' do
      get("/ticket_desks")
      expect(response.status).to eq(200)
    end
end
