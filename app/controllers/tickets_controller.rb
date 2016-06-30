
class TicketsController < ApplicationController

  def index
   @responses = Ticket.new.tickets_by_page(1)
  end


end
