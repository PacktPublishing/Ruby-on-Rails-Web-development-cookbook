class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug, if: -> { slug.blank? }
  
  scope :published, -> { where.not(published_at: nil) }
  scope :recent, -> { order(published_at: :desc) }
  scope :by_category, ->(category) { where(category: category) }
  
  def published?
    published_at.present?
  end
  
  def excerpt(limit = 150)
    summary.present? ? summary : content.truncate(limit)
  end
  
  def to_param
    slug
  end
  
  private
  
  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
