task :check_membership => :environment do
  @users = User.all
  @users.each do |user|
    if user.premium? && user.upgrade_date < 1.year.ago
      user.membership = 0
      user.save
    end
  end
end
