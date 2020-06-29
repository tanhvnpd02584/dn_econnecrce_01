class OrderMailer < ApplicationMailer
  def send_order purchase, email, session
    @purchase = purchase
    @session = session
    mail to: email, subject: t("mail_order.title_mail")
  end
end
