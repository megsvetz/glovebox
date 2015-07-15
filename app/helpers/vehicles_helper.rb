module VehiclesHelper
  def total_amount(vehicle)
    sum = 0
    vehicle.repairs.each do |r|
      sum += r.amount
    end
    return sum
  end
end
