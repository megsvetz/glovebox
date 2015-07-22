class Reminders < ApplicationMailer
  include SendGrid
  default :from => 'GloveBoxTeam@gmail.com'

  def no_insurance(email_addresses)
    email_addresses.each do |email|
      mail :to => email,
           :subject => 'No Insurance entered on GloveBox.com',
           :body => 'Please login at GloveBox.com and enter insurance to more accurately track information about your vehicle!'
    end
  end

  def no_registration(email_addresses)
    email_addresses.each do |email|
      mail :to => email,
           :subject => 'No Registration entered on GloveBox.com',
           :body => 'Please login at GloveBox.com and enter registration to more accurately track information about your vehicle!'
    end
  end

  def expiring_insurance(email_addresses)
    email_addresses.each do |email|
      mail :to => email,
           :subject => 'Insurance expiring soon!',
           :body => 'According to our records your insurance will be expiring within three weeks, please renew as soon as possible enter your new expiration date at GloveBox.com'
    end
  end

  def expiring_registration(email_addresses)
    email_addresses.each do |email|
      mail :to => email,
           :subject => 'Registration expiring soon!',
           :body => 'According to our records your Registration will be expiring within three weeks, please renew as soon as possible enter your new expiration date at GloveBox.com'
    end
  end

  def send_contact_info
    mail :to => 'GloveBoxTeam@gmail.com',
         :subject => "Welcome Test :-)",
         :body => 'This is sample'
  end

  def send_contact_info_html
    mail :to => 'GloveBoxTeam@gmail.com',
         :subject => "test HTML email Subject"
  end

  def email_with_args(to_email, from_email, subject, body)
    mail to: to_email,
         from: from_email,
         subject: subject,
         body: body
  end

  def email_with_args_and_instance_vars(first_name, last_name)
    @first_name = first_name
    @last_name = lastname
    mail :to => "GloveBoxTeam@gmail.com",
         :subject => "test subject"
  end
end
