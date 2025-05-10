class CreateGlassItems < ActiveRecord::Migration[7.1]
  def change
    create_table :glass_items do |t|
      t.string :enternal_code
      t.string :glass_code
      t.decimal :glass_thickness
      t.string :report_category
      t.decimal :glass_weight
      t.string :unit
      t.string :glass_color
      t.decimal :basic_value_in_sqmt
      t.decimal :basic_value_in_sqFt
      t.decimal :total_glass_value
      t.string :glass_name
      t.string :glass_alias
      t.boolean :status

      t.timestamps
    end
  end
end
