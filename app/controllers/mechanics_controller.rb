class MechanicsController < ApplicationController
  require 'yelp'

  def index
    client = Yelp::Client.new({
      binding.pry
      consumer_key: ENV['config.consumer_key'],
      consumer_secret: ENV['config.consumer_secret'],
      token: ENV['config.token'],
      token_secret: ENV['config.token_secret']
    })
    if params[:zip_code]
      @zip = params[:zip_code]
    else
      @zip = current_user.zip_code
    end
    parameters = { term: 'auto repair', limit: 9 }
    @search = Yelp.client.search(@zip, parameters)
  end
end
