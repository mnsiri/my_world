class AddLocationLongitudeToItinerary < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :location_longitude, :float
  end
end
