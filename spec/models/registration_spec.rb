require 'rails_helper'

RSpec.describe Registration, type: :model do
  context "associations" do
    it { should belong_to :vehicle}
  end
end

