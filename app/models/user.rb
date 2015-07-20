class User < ActiveRecord::Base
  has_many :vehicles, dependent: :destroy
  enum membership: [:basic, :premium]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.create_by_csv(file)
    file = params[:file].tempfile
    CSV.parse(File.read(file), headers: true, headers_converters: :symbols).each do |row|
      next if User.find_by(email: row[:email].strip)
      user = User.new
      user.email = row[:email]
      user.username = row[:username]
      user.zipcode = row[:zipcode]
      if user.save
        Contact.send_contact_info_html.deliver
      else
        Contact.email_with_args_and_instance_vars('Jake', 'Sorce').deliver
      end
    end
  end
end
