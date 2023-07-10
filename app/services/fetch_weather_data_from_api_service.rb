# frozen_string_literal: true

class FetchWeatherDataFromApiService < ApplicationService
  def initialize(params)
    @params = params
  end
  
  def call
    if @params[:city]
      Rails.configuration.open_weather_api.current(city: @params[:city])
    else
      Rails.configuration.open_weather_api.current(lon: @params[:longitude], lat: @params[:latitude])
    end
  rescue StandardError => error
    Rails.logger.error(error.inspect)
  end
end