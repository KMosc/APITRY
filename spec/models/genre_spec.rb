require 'rails_helper'

RSpec.describe Genre, type: :model do
  genre = Genre.new(title: nil)
  expect(auction).to_not be_valid
end
