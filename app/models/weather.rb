class Weather < ApplicationRecord
  VALIDITY_TIME = 30
  belongs_to :location
end
