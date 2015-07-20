class Reminders < ApplicationMailer
  include SendGrid
  default :from => 'GloveBoxTeam@gmail.com'

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
