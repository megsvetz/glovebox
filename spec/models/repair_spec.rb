require 'rails_helper'

RSpec.describe Repair, type: :model do
    let(:repair){ FactoryGirl.create(:repair) }

 describe "Repair type" do
   it "Has a valid type" do
    repair.type == Oilchange || Tirerotation || Inspection || Alignment || Modification || Otherrepair 
   end
 end

 context 'relationships' do
    it 'belongs to a vehicle' do
      should belong_to :vehicle
    end
  end 


end
