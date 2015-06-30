class ContactMailer < ActionMailer::Base
  default from: "contact@caffeinedrivendevel.su"

  def contact_email(contact)
    @contact = contact
    mail(to: ENV['ADMIN_EMAIL'], subject: 'New contact')
  end
end
