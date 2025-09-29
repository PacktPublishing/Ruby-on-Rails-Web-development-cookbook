module TicketsHelper
  def status_badge(status)
    case status.to_s
    when "open"
      content_tag :kbd, "Open", style: "background: #4caf50; color: white;"
    when "closed"
      content_tag :kbd, "Closed", style: "background: #6c757d; color: white;"
    when "escalated"
      content_tag :kbd, "Escalated", style: "background: #f44336; color: white;"
    else
      content_tag :kbd, "Unknown", style: "background: #ff9800; color: white;"
    end
  end
end
