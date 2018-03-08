class AddLocationFormattedAddressToItinerary < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :location_formatted_address, :string
  end
end
