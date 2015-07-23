require 'rails_helper'

RSpec.describe Otherrepair, type: :model do

  context "instance methods" do
    describe "type_string" do
      before(:each) do
        @repair_1 = Repair.create(type:"Otherrepair")
      end
      it "should return the type in string form" do
        expect(@repair_1.type_string).to eq("Other Repair")
      end
    end
  end
end
