class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :user_id
      t.integer :photo_id
      t.integer :category_id
      t.string :location

      t.timestamps

    end
  end
end
