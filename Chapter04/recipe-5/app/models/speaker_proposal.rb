class SpeakerProposal < ApplicationRecord
  TRACKS = ["Development", "Design", "Product", "Other"].freeze
  AUDIENCE_LEVELS = ["Beginner", "Intermediate", "Advanced"].freeze

  validates :name, presence: true

  validates :email,
    presence: true,
    format: {with: URI::MailTo::EMAIL_REGEXP,
             message: "doesn’t look like a valid e-mail address"}

  validates :talk_title,
    presence: true,
    length: {maximum: 100,
             too_long: "must be under %{count} characters, long talk titles are hard to grok."}

  validates :talk_description, presence: true, length: {maximum: 500}
  validates :track, presence: true, inclusion: {in: TRACKS}
  validates :audience_level, presence: true, inclusion: {in: AUDIENCE_LEVELS}
  validates :bio, length: {maximum: 250}, allow_blank: true
  validates :duration, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 180}
  validates :terms_of_participation, acceptance: true

  validate :title_and_description_sound_different

  def title_and_description_sound_different
    return unless talk_description&.starts_with?(talk_title.to_s)

    errors.add :base, "Your description shouldn’t start by repeating the title—tell us more!"
  end
end

