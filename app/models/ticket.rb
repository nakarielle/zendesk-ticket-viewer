class Ticket
  attr_accessor :subject, :description, :submitter, :created_at, :priority, :status, :tags, :id

  def initialize(subject, description, submitter, created_at, priority, status, tags, id)
    @subject = subject
    @description = description
    @submitter = submitter
    @created_at = created_at
    @priority = priority
    @status = status
    @tags = tags
    @id = id
  end

  def self.by_page(page_number)
    api = ZendeskApi.new 
    result = api.tickets(page_number)
    tickets = result[:tickets]

    if result[:page] > 1
      first = 0 + (page_number.to_i - 1) * 25 - 100 * (result[:page])
      last = first + 24
    else
      first = 0 + (page_number.to_i - 1) * 25
      last = first + 24
    end

    { tickets: tickets[first..last],
      count: result[:count] }
  end

  def self.single_ticket(id)
    api = ZendeskApi.new
    api.ticket(id)
  end

  def self.num_of_pages
    api = ZendeskApi.new
    tickets = api.tickets
    tickets.size / 25
  end
end
