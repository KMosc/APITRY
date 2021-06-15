require 'rails_helper'

RSpec.describe TicketDesk, type: :model do
    context 'when ticket desk params passed' do
        it 'valid' do
          subject= TicketDesk.create(
            name: 'test',
            automated: true
              )
          expect(subject).to be_valid
        end
      end
end
