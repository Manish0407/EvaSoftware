class CreateTerritoryLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :territory_locations do |t|
      t.integer :territory_master_id
      t.text :hierarchical_geography

      t.timestamps
    end
  end
end
