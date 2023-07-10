class WeathersController < ApplicationController
  before_action :validate_params

  def index
    # make this early return happen in before action
    return unless permitted_params.present?
    @search = permitted_params[:city]
    @weather = weather_data
  end

  def weather_info
    return unless permitted_params.present?
    render partial: 'weathers/weather_info', locals: {weather_info: weather_data}
  end

  private

  def weather_data
    FetchWeatherFromCacheService.new(permitted_params).call ||
    CreateWeatherCacheService.new(permitted_params).call
  end

  def permitted_params
    params.permit(:city, :latitude, :longitude)
  end

  def validate_params
    #TODO implement this
  end
end
