task :find_oil_change => :environment do
  if Time.now.strftime('%d') == '28'
    @vehicles = Vehicle.all
    emails = []
    vehicles = []
    @vehicles.each do |vehicle|
      if vehicle.repairs.present?
        vehicle.repairs.each do |repair|
          if vehicle.user.reminder && repair.type == "Oilchange" && repair.repair_date < (Time.now - (13*7*24*60*60))
            emails << vehicle.user.email
            vehicles << "#{vehicle.make} #{vehicle.model}"
          end
        end
      end
    end
    Reminders.need_oil_change(emails, vehicles).deliver
  end
end

task :find_reg_expire => :environment do
  if Time.now.strftime('%d') == '28' || Time.now.strftime('%d') == '10'
    @vehicles = Vehicle.all
    emails = []
    vehicles = []
    @vehicles.each do |vehicle|
      if vehicle.registration.present?
        if vehicle.user.reminder && vehicle.registration.expiration < Time.now || vehicle.registration.expiration < (Time.now + (3*7*24*60*60))
          emails << vehicle.user.email
          vehicles << "#{vehicle.make} #{vehicle.model}"
        end
      end
    end
    Reminders.expiring_registration(emails, vehicles).deliver
  end
end

task :find_no_reg => :environment do
  if Time.now.strftime('%d') == '28' || Time.now.strftime('%d') == '10'
    @vehicles = Vehicle.all
    emails = []
    vehicles = []
    @vehicles.each do |vehicle|
      unless vehicle.registration.present?
        if vehicle.user.reminder
          emails << vehicle.user.email
          vehicles << "#{vehicle.make} #{vehicle.model}"
        end
      end
    end
    Reminders.no_registration(emails, vehicles).deliver
  end
end

task :find_ins_expire => :environment do
  if Time.now.strftime('%d') == '28' || Time.now.strftime('%d') == '10'
    @vehicles = Vehicle.all
    emails = []
    vehicles = []
    @vehicles.each do |vehicle|
      if vehicle.insurance.present?
        if vehicle.user.reminder && vehicle.insurance.expiration_date < Time.now || vehicle.insurance.expiration_date < (Time.now + (3*7*24*60*60))
          emails << vehicle.user.email
          vehicles << "#{vehicle.make} #{vehicle.model}"
        end
      end
    end
    Reminders.expiring_insurance(emails, vehicles).deliver
  end
end

task :find_no_ins => :environment do
  if Time.now.strftime('%d') == '28' || Time.now.strftime('%d') == '10'
    @vehicles = Vehicle.all
    emails = []
    vehicles = []
    @vehicles.each do |vehicle|
      unless vehicle.insurance.present?
        if vehicle.user.reminder
          emails << vehicle.user.email
          vehicles << "#{vehicle.make} #{vehicle.model}"
        end
      end
    end
    Reminders.no_insurance(emails, vehicles).deliver
  end
end
