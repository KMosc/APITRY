require 'rails_helper'

RSpec.describe "Ticket Desks"
  describe "Fetch ticket desks" do
    it 'works and return status 200' do
      get("/ticket_desks")
      expect(response.status).to eq(200)
    end
end

