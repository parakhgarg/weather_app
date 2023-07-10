# frozen_string_literal: true

class WeatherValidatorService < ApplicationService
  def initialize(weather)
    @weather = weather
  end
  
  def call
    (Time.current - @weather.created_at).minutes <= Weather.VALIDITY_TIME
  end
end
  