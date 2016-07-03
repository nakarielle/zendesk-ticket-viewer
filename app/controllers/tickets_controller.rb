class TicketsController < ApplicationController
  rescue_from HTTParty::Error, with: :error

  def index
    @page = params[:page] || 1 
    result = Ticket.by_page(@page)
    @tickets = result[:tickets]
    @num_of_pages = result[:count] / 25
  end

  def show
    @ticket = Ticket.single_ticket(params[:id])
  end

  def error
    render :error
  end
end
