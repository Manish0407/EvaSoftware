class CreateTerritoryMasters < ActiveRecord::Migration[7.1]
  def change
    create_table :territory_masters do |t|
      t.string :territory_name
      t.text :territory_description

      t.timestamps
    end
  end
end
