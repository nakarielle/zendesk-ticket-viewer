require 'rails_helper'

describe Ticket do 

  describe '.by_page' do
    subject { Ticket.by_page(2) }

    it 'returns an array of 25 objects' do
      expect(subject.size).to eq 25
    end

    it 'contains Ticket objects' do
      item = subject[0]
      expect(item).to be_an_instance_of Ticket
    end
  end

  describe '.single_ticket' do
    subject { Ticket.single_ticket(10) }

    it 'returns the ticket with id of 10' do
      expect(subject.id).to eq 10 
    end
  end
end