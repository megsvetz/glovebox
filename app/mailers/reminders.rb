class Reminders < ApplicationMailer
  include SendGrid
  #require 'SendGrid'

  default :from => 'GloveBoxTeam@gmail.com'

  def need_oil_change(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "#{vehicles[index]} Needs an Oil Change!"
    end
  end

  def no_insurance(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "#{vehicles[index]} has no Insurance Entered on GloveBox.com"
    end
  end

  def no_registration(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "#{vehicles[index]} has no Registration Entered on GloveBox.com"
    end
  end

  def expiring_insurance(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "Your #{vehicles[index]} Insurance is Expiring Soon!"
    end
  end

  def expiring_registration(email_addresses, vehicles)
    email_addresses.each_with_index do |email, index|
      mail :to => email,
           :subject => "Your #{vehicles[index]} Registration is Expiring Soon!"
    end
  end

  def vehicle_transfer(receiver, sender, vehicle)
    @receiver = receiver
    @sender = sender
    @vehicle = vehicle
    mail :to => @receiver,
         :subject => "Vechicle Ownership Transfer Notification"
  end

  # Sample stuff form class about mailers

  def send_contact_info
    mail :to => 'GloveBoxTeam@gmail.com',
         :subject => "Welcome Test :-)",
         :body => 'This is a sample'
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
