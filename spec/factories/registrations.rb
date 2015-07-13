FactoryGirl.define do
  factory :registration do
    state 'Utah'
    expiration { Faker::Date.between(2.days.ago, Date.today) }
    cost 2000
    vehicle
  end
end