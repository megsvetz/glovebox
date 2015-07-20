if Rails.env.development?
  begin
    gas_api = YAML.load(File.read('config/gas.yml'))
    gas_api.each{|key, value| ENV[key] = value}
  rescue
    raise "No gas.yml file found in your config folder"
  end
end
