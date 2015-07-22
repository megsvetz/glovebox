task :find_reg_expire => :environment do
  @vehicles = Vehicle.all
  emails = []
  vehicles = []
  @vehicles.each do |vehicle|
    if vehicle.registration.present?
      if vehicle.registration.expiration < Time.now || vehicle.registration.expiration < (Time.now + (3*7*24*60*60))
        emails << vehicle.user.email
        vehicles << "#{vehicle.make} #{vehicle.model}"
      end
    end
  end
  Reminders.expiring_registration(emails, vehicles).deliver
end

task :find_no_reg => :environment do
  @vehicles = Vehicle.all
  emails = []
  vehicles = []
  @vehicles.each do |vehicle|
    unless vehicle.registration.present?
      emails << vehicle.user.email
      vehicles << "#{vehicle.make} #{vehicle.model}"
    end
  end
  Reminders.no_registration(emails, vehicles).deliver
end

task :find_ins_expire => :environment do
  @vehicles = Vehicle.all
  emails = []
  vehicles = []
  @vehicles.each do |vehicle|
    if vehicle.insurance.present?
      if vehicle.insurance.expiration_date < Time.now || vehicle.insurance.expiration_date < (Time.now + (3*7*24*60*60))
        emails << vehicle.user.email
        vehicles << "#{vehicle.make} #{vehicle.model}"
      end
    end
  end
  Reminders.expiring_insurance(emails, vehicles).deliver
end

task :find_no_ins => :environment do
  @vehicles = Vehicle.all
  emails = []
  vehicles = []
  @vehicles.each do |vehicle|
    unless vehicle.insurance.present?
      emails << vehicle.user.email
      vehicles << "#{vehicle.make} #{vehicle.model}"
      binding.pry
    end
  end
   Reminders.no_insurance(emails, vehicles).deliver
end
