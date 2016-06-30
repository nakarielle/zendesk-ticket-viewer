require 'net/http'
require 'uri'
require 'json'

class Ticket

  def get_tickets
    url = 'https://karina1818.zendesk.com/api/v2/tickets.json'
    uri = URI.parse(url)

    Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      request.basic_auth('klthompsn8@gmail.com', 'LakeLouise09')
      response = http.request request 
      JSON.parse(response.body)["tickets"]
    end
  end

  def tickets_by_page(page_number)
    first = 0 + (page_number-1)*25 
    last = first + 24
    get_tickets[first..last]
  end

  
end
