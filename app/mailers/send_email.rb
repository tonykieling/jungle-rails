class SendEmail < ApplicationMailer
  default from: "notification@jungle.com"

  def send_email(order)
    @order = order

    # Call the mail function in order to send an email to the user with all purchase's data.
    # For the purpose of this project the email is assemblied and sent, but there is no SMTP settings, that is, the development.rb was set to dont show the error, but the message was done to send.
    # config.action_mailer.raise_delivery_errors = false
    mail(to: order.email, subject: "Order id: #{order.id}")
  end

end
