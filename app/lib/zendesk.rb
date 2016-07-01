# require 'net/http'
# require 'uri'
# require 'json'

require 'httparty'

class Zendesk

  def initialize
    request_tickets["tickets"].each do |ticket|
      Ticket.new( ticket["subject"],
                  ticket["description"],
                  ticket["submitter_id"],
                  ticket["created_at"],
                  ticket["priority"],
                  ticket["status"],
                  ticket["tags"],
                  ticket["id"])
    end
  end



  # def get_single_ticket(id)
  #   auth = {:username => "klthompsn8@gmail.com", :password => "LakeLouise09"}
  #   HTTParty.get("https://karina1818.zendesk.com/api/v2/tickets/#{id}.json", 
  #                    :basic_auth => auth)["ticket"]
  # end

  private

  def request_tickets
    auth = {:username => "klthompsn8@gmail.com", :password => "LakeLouise09"}
    response = HTTParty.get('https://karina1818.zendesk.com/api/v2/tickets.json', 
                     :basic_auth => auth)
    end

end