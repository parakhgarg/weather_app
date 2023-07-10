# frozen_string_literal: true

class CreateWeatherCacheService < ApplicationService
  def initialize(params)
    @params = params
  end
  
  def call
    #TODO not tested not fully functional
    weather = FetchWeatherDataFromApiService.new(@params).call
    location = Location.find_or_create_by(city: @params[:city]) if @params[:city]
    location = Location.find_or_create_by(latitude: @params[:latitude], longitude: @params[:longitude]) if @params[:latitude] && @params[:longitude]
    location.weather.destroy if location.weather.exists?
    location.weather.create(location)
  rescue

  end
end
  