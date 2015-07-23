require 'yelp'

Yelp.client.configure do |config|
 config.consumer_key = ENV['config.consumer_key']
 config.consumer_secret = ENV['config.consumer_secret']
 config.token = ENV['config.token']
 config.token_secret = ENV['config.token_secret']
end
