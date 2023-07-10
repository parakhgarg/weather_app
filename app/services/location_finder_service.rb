# frozen_string_literal: true

class LocationFinderService < ApplicationService
  def initialize(params)
    @params = params
  end
  
  def call
    location_by_city || location_by_lat_long
  end

  def location_by_city
    Location.find_by(city: @params[:city]) if @params[:city]
  end

  def location_by_lat_long
    if @params[:latitude] && @params[:longitude]
      Location.find_by(
        latitude: @params[:latitude],
        longitude: @params[:longitude]
      )
    end
  end
end
  