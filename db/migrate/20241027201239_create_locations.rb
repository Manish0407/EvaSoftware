class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.integer :location_code

      t.timestamps
    end
  end
end
