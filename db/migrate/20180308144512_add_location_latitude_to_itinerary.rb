class AddLocationLatitudeToItinerary < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :location_latitude, :float
  end
end
