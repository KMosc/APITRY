require 'rails_helper'

RSpec.describe Genre, type: :model do
    describe 'validations' do
        context 'when all params are passed' do
          it 'creates genre with valid params: {title, description}' do
            subject= Genre.create(title: 'test', description: 'test')
            expect(subject).to be_valid
          end
        end
    end
    describe 'validations' do
        context 'when title is integer, description is string' do
          it 'not valid' do
            subject= Genre.create(title: 100, description: 'test')
            expect(subject).to be_valid
          end
        end
    end
    describe 'validations' do
        context 'when params is nil' do
          it 'not valid' do
            subject= Genre.create(title: nil, description: nil)
            expect(subject).to be_valid
          end
        end
    end
end