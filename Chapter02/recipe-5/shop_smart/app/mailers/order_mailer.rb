class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation_email.subject
  #
  def confirmation_email
    @order = params[:order]
    @customer = @order.customer
    mail(
      to: @customer.email,
      subject: "Order Confirmation - Order ##{@order.id}"
    )
  end
end
