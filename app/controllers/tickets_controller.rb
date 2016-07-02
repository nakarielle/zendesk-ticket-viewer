
class TicketsController < ApplicationController
  def index
    page = params[:page] || 1
    @tickets = Ticket.by_page(page) 
  end

  def show
    @ticket = Ticket.single_ticket(params[:id])
  end
end
