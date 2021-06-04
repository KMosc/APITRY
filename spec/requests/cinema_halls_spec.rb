require 'rails_helper'

RSpec.describe "Cinema Halls test"
  describe "Fetch cinema halls" do
    it 'works and return status 201' do
      get("/ticket_desks/:id/cinema_halls")
      expect(response.status).to eq(200)
    end
end


RSpec.describe "Ticket Desks"
  describe "create movies" do
    it 'works and return status 201' do
      post("/ticket_desks", params: { ticket_desks: {  name: "aaa", automated: true} } )
      expect(response.status).to eq(200)
    end
end
