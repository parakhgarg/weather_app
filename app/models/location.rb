class Location < ApplicationRecord
  has_one :location, dependent: :destroy
end
