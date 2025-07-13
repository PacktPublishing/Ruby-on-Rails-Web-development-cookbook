class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    
    mail(
      to: 'admin@example.com', # Change this to your desired recipient
      subject: "#{name} sent you a message",
      from: email
    )
  end
end 