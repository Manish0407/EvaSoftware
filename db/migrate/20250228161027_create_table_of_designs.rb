class CreateTableOfDesigns < ActiveRecord::Migration[7.1]
  def change
    create_table :designs do |t|
      t.string :desing_ref
      t.string :quantity
      t.string :desing_name
      t.string :location
      t.string :floor_number
      t.string :note
      t.references :glass_item
      t.float :price
      t.float :width
      t.float :height
      t.float :area
      t.float :total_weight
      t.float :rate_of_sqft
      t.json :handles, default: {}
      t.json :seactions, default: {}
      t.references :quote
      t.timestamps
    end
  end
end
