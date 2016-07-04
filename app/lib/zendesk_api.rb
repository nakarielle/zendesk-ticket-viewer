class ZendeskApi
  def initialize
    @auth = { username: 'klthompsn8@gmail.com',
              password: 'LakeLouise09' }
  end

  def tickets(page)
    zendesk_page = (page.to_f / 4).ceil
    # Zendesk API returns 100 results per page, I need 25 per page
    api_response = api_call("https://karina1818.zendesk.com/api/v2/tickets.json?page=#{zendesk_page}&sort_by=updated_at&sort_order=desc")
    tickets = api_response['tickets']

    { tickets: tickets.map { |ticket| new_ticket(ticket) },
      zendesk_page: zendesk_page,
      count: api_response['count'] }
  end

  def ticket(id)
    ticket = api_call("https://karina1818.zendesk.com/api/v2/tickets/#{id}.json")['ticket']
    new_ticket(ticket)
  end

  private
  
  def api_call(url)
    begin
      response = HTTParty.get(url, basic_auth: @auth)
    rescue Timeout::Error, Errno::ECONNRESET, Errno::EINVAL, 
           Errno::ECONNRESET, EOFError,  Net::HTTPBadResponse, 
           Net::HTTPHeaderSyntaxError, Net::ProtocolError, SocketError => e
       raise HTTParty::Error.new(e.message)
    end
    raise HTTParty::Error.new('Bad response') unless response.success?
    response
  end

  def new_ticket(ticket)
    Ticket.new(ticket['subject'],
               ticket['description'],
               ticket['submitter_id'],
               ticket['created_at'],
               ticket['updated_at'],
               ticket['status'],
               ticket['id'])
  end
end
