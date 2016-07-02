class TicketsController < ApplicationController
  rescue_from HTTParty::Error, with: :error

  def index
    page = params[:page] || 1
    @tickets = Ticket.by_page(page) 
  end

  def show
    @ticket = Ticket.single_ticket(params[:id])
  end

  def error
    render :error
  end
end
