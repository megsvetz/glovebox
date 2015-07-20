if Rails.env.development?
  begin
    vehicle_api = YAML.load(File.read('config/vehicle.yml'))
    vehicle_api.each{|key, value| ENV[key] = value}
  rescue
    raise "No vehicle.yml file found in your config folder"
  end
end
