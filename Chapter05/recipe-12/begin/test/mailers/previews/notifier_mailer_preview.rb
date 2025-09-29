# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/ticket_escalated
  def ticket_escalated
    NotifierMailer.ticket_escalated
  end
end
