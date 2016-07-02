class ZendeskApi
  def initialize
    @auth = {:username => 'klthompsn8@gmail.com',
            :password => 'LakeLouise'}
  end

  def get_tickets
    tickets = api_call('.json?sort_by=created_at')['tickets']
    tickets.map { |ticket| new_ticket(ticket) }
  end

  def get_ticket(id)
    ticket = api_call("/#{id}.json")['ticket']
    new_ticket(ticket)
  end

  private

  def api_call(endpoint)
    url = "https://karina1818.zendesk.com/api/v2/tickets#{endpoint}"
    response = HTTParty.get(url, :basic_auth => @auth)
    raise HTTParty::Error.new('Bad response') unless response.success?
    response
  end

  def new_ticket(ticket)
     Ticket.new(
      ticket['subject'],
      ticket['description'],
      ticket['submitter_id'],
      ticket['created_at'],
      ticket['priority'],
      ticket['status'],
      ticket['tags'],
      ticket['id']
    )
  end
end
