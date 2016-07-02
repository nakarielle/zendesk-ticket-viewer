class ZendeskApi

  def initialize
    @auth = {:username => "klthompsn8@gmail.com",
            :password => "LakeLouise09"}
  end

  #Up to 100 tickets per page
  def get_tickets
    api_call["tickets"].map { |ticket| new_ticket(ticket) }
  end

  def get_ticket(id)
    ticket = api_call(id)["ticket"]
    new_ticket(ticket)
  end

  private

  def api_call(ticket="all")
    # put error handling in here
    if ticket == "all"
      HTTParty.get('https://karina1818.zendesk.com/api/v2/tickets.json', :basic_auth => @auth)
    else
      HTTParty.get("https://karina1818.zendesk.com/api/v2/tickets/#{ticket}.json", :basic_auth => @auth)
    end
  end

  def new_ticket(ticket)
     Ticket.new(
      ticket["subject"],
      ticket["description"],
      ticket["submitter_id"],
      ticket["created_at"],
      ticket["priority"],
      ticket["status"],
      ticket["tags"],
      ticket["id"]
    )
  end
end

