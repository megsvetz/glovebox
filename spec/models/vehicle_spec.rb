require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context "associations" do
    it { should belong_to :user}
    it { should have_one :insurance}
    it { should have_one :registration}
    it { should have_many :repairs}
  end

  context "class methods" do
    before(:each) do
      @vehicle_1 = Vehicle.create(type:"Car")
      @vehicle_2 = Vehicle.create(type:"Truck")
      @vehicle_3 = Vehicle.create(type:"Boat")
      @vehicle_4 = Vehicle.create(type:"Trailer")
      @vehicle_5 = Vehicle.create(type:"ATV")
      @vehicle_6 = Vehicle.create(type:"Motorcycle")
      @vehicle_7 = Vehicle.create(type:"Waverunner")
      @vehicle_8 = Vehicle.create(type:"Dunebuggy")
      @vehicle_9 = Vehicle.create(type:"Other")
    end
    describe "self.type" do
      it "ensures types are specific ones" do
        expect(Vehicle.type).to eq(["Car", "Truck", "Boat", "Trailer", "ATV", "Motorcycle", "Waverunner", "Dunebuggy", "Other"])
      end
    end

    describe "self.car" do
      it "should return car" do
        expect(Vehicle.car).to eq(Vehicle.where(type: 'Car'))
      end
    end

    describe "self.truck" do
      it "should return truck" do
        expect(Vehicle.truck.first).to eq(@vehicle_2)
      end
    end

    describe "self.boat" do
      it "should return boat" do
        expect(Vehicle.boat.first).to eq(@vehicle_3)
      end
    end

    describe "self.trailer" do
      it "should return trailer" do
        expect(Vehicle.trailer.first).to eq(@vehicle_4)
      end
    end

    describe "self.ATV" do
      it "should return ATV" do
        expect(Vehicle.atv.first).to eq(@vehicle_5)
      end
    end

    describe "self.motorcycle" do
      it "should return motorcycle" do
        expect(Vehicle.motorcycle.first).to eq(@vehicle_6)
      end
    end

    describe "self.waverunner" do
      it "should return waverunner" do
        expect(Vehicle.waverunner.first).to eq(@vehicle_7)
      end
    end

    describe "self.dunebuggy" do
      it "should return dunebuggy" do
        expect(Vehicle.dunebuggy.first).to eq(@vehicle_8)
      end
    end

    describe "self.other" do
      it "should return other" do
        expect(Vehicle.other.first).to eq(@vehicle_9)
      end
    end
  end

end
