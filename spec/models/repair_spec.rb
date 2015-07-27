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

  context "associations" do
    it { should belong_to :vehicle}
    it { should validate_presence_of :type}
  end

  context "class methods" do
    before(:each) do
      @repair_1 = Repair.create(type:"Oilchange")
      @repair_2 = Repair.create(type:"Tirerotation")
      @repair_3 = Repair.create(type:"Inspection")
      @repair_4 = Repair.create(type:"Alignment")
      @repair_5 = Repair.create(type:"Modification")
      @repair_6 = Repair.create(type:"Otherrepair")
    end
    describe "self.types" do
      it "ensures types are specific ones" do
        expect(Repair.types).to eq(["Oilchange", "Tirerotation", "Inspection", "Alignment", "Modification", "Otherrepair"])
      end
    end

    describe "self.oilchanges" do
      it "should return oilchanges" do
        expect(Repair.oilchanges).to eq(Repair.where(type: 'Oilchange'))
      end
    end

    describe "self.tirerotations" do
      it "should return tirerotations" do
        expect(Repair.tirerotations.first).to eq(@repair_2)
      end
    end

    describe "self.inspections" do
      it "should return inspections" do
        expect(Repair.inspections.first).to eq(@repair_3)
      end
    end

    describe "self.alignments" do
      it "should return alignments" do
        expect(Repair.alignments.first).to eq(@repair_4)
      end
    end

    describe "self.modifications" do
      it "should return modifications" do
        expect(Repair.modifications.first).to eq(@repair_5)
      end
    end

    describe "self.otherrepairs" do
      it "should return otherrepairs" do
        expect(Repair.otherrepairs.first).to eq(@repair_6)
      end
    end
  end

  context "instance methods" do
    describe "type_string" do
      before(:each) do
        @repair_1 = Repair.create(type:"Oilchange")
        @repair_2 = Repair.create(type:"Tirerotation")
        @repair_3 = Repair.create(type:"Inspection")
        @repair_4 = Repair.create(type:"Alignment")
        @repair_5 = Repair.create(type:"Modification")
        @repair_6 = Repair.create(type:"Otherrepair")
      end
      it "should return the type in string form" do
        expect(@repair_1.type_string).to eq("Oil Change")
      end
      it "should return the type in string form" do
        expect(@repair_2.type_string).to eq("Tire Rotation")
      end
      it "should return the type in string form" do
        expect(@repair_3.type_string).to eq("Inspection")
      end
      it "should return the type in string form" do
        expect(@repair_4.type_string).to eq("Alignment")
      end
      it "should return the type in string form" do
        expect(@repair_5.type_string).to eq("Modification")
      end
      it "should return the type in string form" do
        expect(@repair_6.type_string).to eq("Other Repair")
      end
    end
  end
end
