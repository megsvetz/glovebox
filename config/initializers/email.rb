if Rails.env.development?
  begin
    email_config = YAML.load(File.read('config/email.yml'))
    email_config.each{|key, value| ENV[key] = value}
  rescue
    raise "No email.yml file found in your config folder"
  end
end
