require 'rails_helper'

RSpec.describe Repair, type: :model do
  context "associations" do
    it { should belong_to :vehicle}
    it { should validate_presence_of :type}
  end

  context "class methods" do
    describe "self.types" do
      it "ensures types are specific ones" do
        expect(Repair.types).to eq(["Oilchange", "Tirerotation", "Inspection", "Alignment", "Modification", "Otherrepair"])
      end
    end

    describe "self.oilchanges" do
      it "should return oilchange" do
        expect(Repair.oilchanges).to eq(["type", "Oilchange"])
      end
    end



end


  # def self.tirerotations
  #   where(type: 'Tirerotation')
  # end
  # def self.inspections
  #   where(type: 'Inspection')
  # end
  # def self.alignments
  #   where(type: 'Alignment')
  # end
  # def self.modifications
  #   where(type: 'Modification')
  # end
  # def self.otherrepairs
  #   where(type: 'Otherrepair')
  # end

  # def type_string
  #   raise "override me in the subclass"
  # end


