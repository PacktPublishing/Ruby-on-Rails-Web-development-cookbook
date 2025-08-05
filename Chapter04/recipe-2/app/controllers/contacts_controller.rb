class ContactsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Basic validation
    if name.blank? || email.blank? || message.blank?
      flash.now[:error] = "Please fill in all fields."
      render :new, status: :unprocessable_entity
      return
    end

    # Email format validation
    unless email =~ URI::MailTo::EMAIL_REGEXP
      flash.now[:error] = "Please enter a valid email address."
      render :new, status: :unprocessable_entity
      return
    end

    # Send email
    ContactMailer.contact_email(name, email, message).deliver_now
    
    redirect_to new_contact_path, notice: 'Thank you for your message. We will get back to you soon!'
  end
end 