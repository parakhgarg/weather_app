OpenWeatherAPI.configure do |config|
  #TODO move API key to proper location and fetch from ENV
  config.api_key = "ba9b277395aee9350d2ac916a915a033"
end

Rails.configuration.open_weather_api