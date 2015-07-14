class GasController < ApplicationController
  def index
    @hash = Gmaps4rails.build_markers(@current_user) do |item, marker|
      marker.lat item
      marker.lng item
    end
  end

  def get_coords
    @hash = Gmaps4rails.build_markers(@current_user) do |item, marker|
      marker.lat params[:latitude]
      marker.lng params[:long]
      
    end
  end
end
