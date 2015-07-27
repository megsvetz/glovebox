require 'rails_helper'

Contact = Struct.new(:first_name, :last_name, :email, :phone, :message, :subject, :to, :from)

RSpec.describe Contact.new("Meg", "Svetz", "megsvetz@gmail.com", "916-775-3355", "Hello."), type: :model do

  context "attributes" do
    it { is_expected.to have_attributes(:first_name => "Meg") }
    it { is_expected.to have_attributes(:last_name => "Svetz") }
    it { is_expected.to have_attributes(:email => "megsvetz@gmail.com") }
    it { is_expected.to have_attributes(:phone => "916-775-3355") }
    it { is_expected.to have_attributes(:message => "Hello.") }
  end

  context "instance methods" do
    before(:each) do
    end

    describe "headers" do

    end
  end
end
