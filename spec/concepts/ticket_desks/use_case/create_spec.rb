RSpec.describe  do
    let(:repository) { Repository::TicketDeskRepository.new() }
    
    subject { UseCase::TicketDesk::Create.new(repository).call(name: 'text', automated: true) }
    describe '.call' do
        it 'creates ticket_desk with valid params' do
            expect(subject).to be_a_kind_of(TicketDesk)

        end
    end
end
