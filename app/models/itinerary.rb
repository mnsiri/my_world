require 'open-uri'
class Itinerary < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  belongs_to :photo

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :users,
             :through => :likes,
             :source => :user

  # Validations

end
