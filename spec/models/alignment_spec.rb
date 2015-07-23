require 'rails_helper'

RSpec.describe Alignment, type: :model do

  context "instance methods" do
    describe "type_string" do
      before(:each) do
        @repair_1 = Repair.create(type:"Alignment")
      end
      it "should return the type in string form" do
        expect(@repair_1.type_string).to eq("Alignment")
      end
    end
  end
end
