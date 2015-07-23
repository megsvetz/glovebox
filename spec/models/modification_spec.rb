require 'rails_helper'

RSpec.describe Modification, type: :model do

  context "instance methods" do
    describe "type_string" do
      before(:each) do
        @repair_1 = Repair.create(type:"Modification")
      end
      it "should return the type in string form" do
        expect(@repair_1.type_string).to eq("Modification")
      end
    end
  end
end
