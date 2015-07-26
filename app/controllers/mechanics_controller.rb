class MechanicsController < ApplicationController

  def index
    @zip = current_user.zip_code
    parameters = { term: 'auto repair', limit: 9 }
    @search = client.search(@zip, parameters)
  end

  private
  def client
    @client ||= Yelp::Client.new({ consumer_key: ENV['config.consumer_key'],
      consumer_secret: ENV['config.consumer_secret'],
      token: ENV['config.token'],
      token_secret: ENV['config.token_secret']
    })
  end
end
