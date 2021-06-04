require 'rails_helper'

RSpec.describe "Movies"
  describe "Fetch movies" do
    it 'works and return status 201' do
      get("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies")
      expect(response.status).to eq(200)
    end
end


RSpec.describe "Movies"
  describe "create movies" do
    it 'works and return status 201' do
      post("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies", params: { movie: {  title: "aaa", description: "aaa", age_restriction: 16, starts_at: "18:00", ends_at: "20:00", genre_id: 1, cinema_hall_id: :cinema_hall_id, ticket_desk_id: :ticket_desk_id} } )
      expect(response.status).to eq(200)
    end
end
