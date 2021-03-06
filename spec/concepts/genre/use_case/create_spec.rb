require 'rails_helper'

RSpec.describe "Genre concept create" do
    let(:repository) { Repository::GenreRepository.new() }
    
    subject { UseCase::Genres::Create.new(repository).call(title: 'test', description: 'test') }
    describe '.call' do
        it 'creates genre with valid params' do
            expect(subject).to be_a_kind_of(Genre)

        end
    end
end
