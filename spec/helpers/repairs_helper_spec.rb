require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VehiclesHelper. For example:
#
# describe VehiclesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe VehiclesHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end


module RepairsHelper
  # Returns a dynamic path based on the provided parameters
  def sti_repair_path(vehicle, type = "repair", repair = nil, action = nil)
    send "#{format_action(action)}vehicle_#{format_sti(type, repair)}_path", vehicle, repair
  end

  def format_sti(type, repair)
    repair ? "#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end