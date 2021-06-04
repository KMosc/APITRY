require 'rails_helper'

RSpec.describe "Ticket Desks"
  describe "Fetch ticket desks" do
    it 'works and return status 201' do
      get("/ticket_desks/:id/")
      expect(response.status).to eq(204)
    end
end


RSpec.describe "Ticket Desks"
  describe "create movies" do
    it 'works and return status 201' do
      post("/ticket_desks", params: { ticket_desks: {  name: "aaa", automated: true} } )
      expect(response.status).to eq(200)
    end
end
