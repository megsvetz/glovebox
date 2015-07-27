class MechanicsController < ApplicationController

  def index
      current_user.zip_code.present? ? @zip = current_user.zip_code : @zip = "94101"
      parameters = { term: 'auto repair', limit: 9 }
      @search = client.search(@zip, parameters)
  end

  def mechanics_update
    parameters = { term: 'auto repair', limit: 9 }
    @search = client.search(params[:zip_code].to_i, parameters)
    render(json: @search)
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
