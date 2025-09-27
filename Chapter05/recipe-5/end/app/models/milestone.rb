class Milestone < ApplicationRecord
  include StatusSummarizable

  private

  def prefix_status
    "Blocked: " if blocked?
  end
end
