require 'rails_helper'

RSpec.describe CinemaHall, type: :model do
      describe 'validations' do
        context 'when all params are passed' do
          it 'creates hall with valid number and capacity' do
            subject= CinemaHall.create(volume: 100)
            expect(subject).to be_valid
          end
        end
    end
    describe 'validations' do
        context 'when param is string' do
          it 'not valid' do
            subject= CinemaHall.create(volume: "X")
            expect(subject).to_not be_valid
          end
        end
    end
    describe 'validations' do
        context 'when param volume is nil' do
          it 'not valid' do
            subject= CinemaHall.create(volume: nil)
            expect(subject).to_not be_valid
          end
        end
    end
end

