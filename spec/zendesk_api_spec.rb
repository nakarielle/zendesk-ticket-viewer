require 'rails_helper'

describe ZendeskApi do 

  describe '#get_tickets' do

    context "error handling" do
      let(:api) { ZendeskApi.new } 
      

      it 'expects error' do
        allow(api).to receive(:get_tickets) { raise HTTParty::Error }
        expect{ api.get_tickets }.to raise_error(HTTParty::Error)
      end
    end

  end
end
