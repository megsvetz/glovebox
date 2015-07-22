require 'rails_helper'

RSpec.describe Insurance, type: :model do
    context "associations" do
    it { should belong_to(:vehicle) }
  end
end
