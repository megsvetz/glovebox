class MechanicsController < ApplicationController

  def index
    if params[:zip_code]
      @zip = params[:zip_code]
      redirect_to mechanics_path(@zip)
    else
      @zip = current_user.zip_code
    end
    parameters = { term: 'auto repair', limit: 9 }
    @search = Yelp.client.search(@zip, parameters)
  end
end
