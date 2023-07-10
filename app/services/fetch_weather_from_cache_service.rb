# frozen_string_literal: true

class FetchWeatherFromCacheService < ApplicationService
  def initialize(params)
    @params = params
  end
  
  def call
    location = LocationFinderService.new(@params).call
    return unless location

    weather = location.weather
    return unless weather

    weather if WeatherValidatorService.new(weather).call
  end
end
  