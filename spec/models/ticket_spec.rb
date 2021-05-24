require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'before publication' do  # (almost) plain English
    it 'cannot have ticket' do   #
      expect { Ticket.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end
