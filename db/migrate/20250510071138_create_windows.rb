class CreateWindows < ActiveRecord::Migration[7.1]
  def change
    create_table :windows do |t|
      t.string :name
      t.string :description
      t.references :design
      t.references :quote
      t.string :location
      t.string :floor_number
      t.string :note
      t.string :quantity
      t.string :glass_type
      t.string :glass_thickness
      t.string :glass_color
      t.string :glass_ref
      t.string :glass_size
      t.string :glass_weight
      t.string :glass_area
      t.string :glass_price
      t.string :glass_total_weight
      t.string :glass_rate_of_sqft
      t.string :glass_total_price
      t.float :window_total_price
      t.string :height
      t.string :width
      t.string :area
      t.string :total_weight
      t.timestamps
    end
  end
end
