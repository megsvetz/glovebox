require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many :vehicles}
  end
end

