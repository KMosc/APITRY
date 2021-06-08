require 'rails_helper'

RSpec.describe "Movies requests" do
  describe "GET /Genres" do
    it "Fetch all genre" do
      get("/genre")
      expect(response.status).to eq(200)
    end
  end
  describe "POST /genres" do

    it "Create the movies" do
      post("/genre", params: {title: "test", description: "test"})
      expect(response.status).to eq(200)
    end
  end

end