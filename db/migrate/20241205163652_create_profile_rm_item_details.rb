class CreateProfileRmItemDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_rm_item_details do |t|
      t.string :rm_code
      t.string :rm_item_name
      t.decimal :standard_bar_length
      t.decimal :cutting_blade_thickness
      t.decimal :standard_bar_total_trim_length
      t.decimal :reusable_offcut_length

      t.timestamps
    end
  end
end
