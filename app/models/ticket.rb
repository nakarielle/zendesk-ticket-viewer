
class Ticket

  attr_accessor :subject, :description, :created_at, :priority, :status, :tags, :id

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

  def self.all
    tickets = ObjectSpace.each_object(self).to_a
  end

  def self.by_page(page_number)
    first = 0 + (page_number-1)*25 
    last = first + 24
    all[first..last]
  end

  def self.find(id)
    all.select { |ticket| ticket.id == id }
  end







end
