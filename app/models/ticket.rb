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
    tickets = api.get_tickets

    first = 0 + (page_number.to_i-1)*25 
    last = first + 24
    tickets[first..last]
  end

  def self.single_ticket(id)
    api = ZendeskApi.new
    api.get_ticket(id)
  end
end
