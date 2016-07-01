
class TicketsController < ApplicationController

  def index
   @responses = Ticket.new.tickets_by_page(1)
  end

  def show
   @ticket = Ticket.new.get_single_ticket(params[:id])
  end



end
