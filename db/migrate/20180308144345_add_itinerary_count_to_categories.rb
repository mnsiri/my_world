class AddItineraryCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :itineraries_count, :integer
  end
end
