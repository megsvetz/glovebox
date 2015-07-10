FactoryGirl.define do
  factory :registration do
    state 'Utah'
    expiration 2016-03-15
    cost 2000
    vehicle_id 1
  end
end