module StatusSummarizable
  extend ActiveSupport::Concern

  def status_summary
    "#{prefix_status}#{process_status}"
  end

  private

  def process_status
    return "Completed" if completed?
    return "No due date" if due_on.blank?

    today = Date.current
    return "Overdue"   if due_on < today
    return "Due today" if due_on == today

    "Due in #{(due_on - today).to_i} days"
  end

  def prefix_status = ""
end
