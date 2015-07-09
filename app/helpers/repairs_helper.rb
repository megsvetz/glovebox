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
