class CreateHardwarePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :hardware_prices do |t|
      t.string :rm_code
      t.string :item_name
      t.string :brand_name
      t.string :unit
      t.string :currency
      t.decimal :default_price_rate
      t.decimal :weight_per_unit
      t.string :select_price_level
      t.string :rate_calculate_formula

      t.timestamps
    end
  end
end
