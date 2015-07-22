FactoryGirl.define do
  factory :repair do
    type "Oilchange"
    repair_description "This is a repair desription"
    repair_date { Faker::Date.between(2.days.ago, Date.today) }
    repair_cost 2000
    vehicle
  end
end
