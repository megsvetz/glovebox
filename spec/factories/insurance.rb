FactoryGirl.define do
  factory :insurance do
  policy_number '12345'
  company 'allstate'
  cost 200
  vehicle
 end
end