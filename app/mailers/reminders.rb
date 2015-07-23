class Reminders < ApplicationMailer
  include SendGrid
  #require 'SendGrid'

  default :from => 'GloveBoxTeam@gmail.com'

  def no_insurance(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "#{vehicles[index]} has no Insurance entered on GloveBox.com"
    end
  end

  def no_registration(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "#{vehicles[index]} has no Registration entered on GloveBox.com"
    end
  end

  def expiring_insurance(email_addresses, vehicles)
    email_addresses.uniq.each_with_index do |email, index|
      mail :to => email,
           :subject => "Your #{vehicles[index]} insurance expiring soon!"
    end
  end

  def expiring_registration(email_addresses, vehicles)
    email_addresses.uniq.each_with_index do |email, index|
      mail :to => email,
           :subject => "Your #{vehicles[index]} registration expiring soon!"
    end
  end

  # Sample stuff form class about mailers

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
