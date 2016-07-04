class Ticket
  attr_accessor :subject, :description, :submitter, :created_at, :updated_at, :status, :id

  def initialize(subject, description, submitter, created_at, updated_at, status, id)
    @subject = subject
    @description = description
    @submitter = submitter
    @created_at = created_at
    @updated_at = updated_at
    @status = status
    @id = id
  end

  def self.by_page(page_number)
    api = ZendeskApi.new
    result = api.tickets(page_number)
    # Accounting for indices in page 2 and beyond of results
    if result[:zendesk_page] > 1
      start = 0 + (page_number.to_i - 1) * 25 - 100 * (result[:zendesk_page] - 1)
    else
      start = 0 + (page_number.to_i - 1) * 25 # For page 1 of results
    end
    tickets = result[:tickets]
    { tickets: tickets[start..start + 24], count: result[:count] }
  end

  def self.single_ticket(id)
    api = ZendeskApi.new
    api.ticket(id)
  end
end
