
class TicketsController < ApplicationController

  def index
    tickets = Zendesk.new
    @responses = Ticket.by_page(1)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end



end
