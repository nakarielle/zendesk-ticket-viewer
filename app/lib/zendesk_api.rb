class ZendeskApi
  def initialize
    @auth = { username: 'klthompsn8@gmail.com',
              password: 'LakeLouise09' }
  end

  def tickets(page)
    zendesk_page = zendesk_page_for(page)
    api_response = api_call("https://karina1818.zendesk.com/api/v2/tickets.json?page=#{zendesk_page}")
    tickets = api_response['tickets']
    
    { tickets: tickets.map { |ticket| new_ticket(ticket) },
      page: zendesk_page,
      count: api_response['count'] }
  end

  def ticket(id)
    ticket = api_call("https://karina1818.zendesk.com/api/v2/tickets/#{id}.json")['ticket']
    new_ticket(ticket)
  end  

  private

  def zendesk_page_for(page)
    (page.to_f / 4).ceil
  end

  def api_call(url)
    response = HTTParty.get(url, basic_auth: @auth)
    raise HTTParty::Error.new('Bad response') unless response.success?
    response
  end

  def new_ticket(ticket)
    Ticket.new(ticket['subject'],
               ticket['description'],
               ticket['submitter_id'],
               ticket['created_at'],
               ticket['priority'],
               ticket['status'],
               ticket['tags'],
               ticket['id'])
  end
end
