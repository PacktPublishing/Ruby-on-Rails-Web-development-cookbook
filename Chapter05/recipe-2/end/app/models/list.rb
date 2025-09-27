class List < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def progress
    total = tasks.count
    done = tasks.where(completed: true).count
    remaining = total - done
    {
      total: total,
      completed: done,
      remaining: remaining,
      percent_complete: total.zero? ? 0 : ((done.to_f / total) * 100).round
    }
  end
end
