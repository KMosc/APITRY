require 'rails_helper'

RSpec.describe "Movies requests" do
  describe "GET /cinema_halls" do
    it "Fetch all cinema_halls" do
      get("/cinema_halls")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /cinema_halls" do

    it "Create the cinema_halls" do
      post("/cinema_halls", params: {volume: 200})
      expect(response.status).to eq(200)
    end
  end

end