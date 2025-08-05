class Note < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  def preview
    content&.truncate(100)
  end
end
