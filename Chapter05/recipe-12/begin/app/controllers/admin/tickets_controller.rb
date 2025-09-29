class Admin::TicketsController < ApplicationController
  before_action :require_admin
  before_action :set_ticket, only: [:escalate]

  def escalate
    @ticket.escalate!
    
    respond_to do |format|
      format.json { render json: { status: "escalated", message: "Ticket has been escalated" } }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def require_admin
    head :unauthorized unless admin?
  end

  def admin?
    params[:admin_key] == "secret_admin_key"
  end
end