require 'rails_helper'

RSpec.describe "Tickets"
  describe "Fetch tickets" do
    it 'works and return status 201' do
      get("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies/:movie_id/ticket")
      expect(response.status).to eq(200)
    end
end


RSpec.describe "Tickets"
  describe "create tickets" do
    it 'works and return status 201' do
      post("/ticket_desks/:id/cinema_halls/:cinema_hall_id/movies/:movie_id/ticket", 
      params: { 
          movie: {  
              pad: "true", 
              password: "XD", 
              seat: "1B", 
              ticket_desk_id: :ticket_desk_id, 
              cinema_hall_id: :cinema_hall_id, 
              movie_id: :movie_id
              } 
            } 
        )
      expect(response.status).to eq(422)
    end
end
