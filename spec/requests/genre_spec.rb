require 'rails_helper'

RSpec.describe "Genres"
  describe "Fetch genres" do
    it 'works and return status 201' do
      get("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies/:movie_id/genre")
      expect(response.status).to eq(200)
    end
end


RSpec.describe "Genres"
  describe "create movies" do
    it 'works and return status 200' do
      post("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies/:movie_id/genre", params: { genre: {  title: "aaa", description: "aaa"} } )
      expect(response.status).to eq(200)
    end
end
