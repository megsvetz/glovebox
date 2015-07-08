namespace :db do
  desc "Create 100 vehicles with random names and descriptions"
  task :populate => :environment do
	require 'populator'
	require 'faker'
  User.populate 10 do |a|
    a.email = Faker::Internet.email
    a.encrypted_password = User.new(:password => 'password', :password_confirmation => 'password').encrypted_password
    a.sign_in_count = 5
  end

	  Vehicle.populate 10 do |v|
  		v.make = Faker::Name.name
  		v.model = Faker::Name.name
      v.year = rand(1915..2016)
      v.mileage = rand(0..300000)
      v.name = Faker::Hacker.noun
      v.vin = Faker::Lorem.characters(15)
      v.license_plate = Faker::Lorem.characters(10)
      v.state = Faker::Address.state
      v.user_id = rand(1..10)
	  end
    Vehicle.all.each { |user| user.image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); user.save! }
	  puts 'All done'
  end
end
