class AddDefaultPriceColumnToDesigns < ActiveRecord::Migration[7.1]
  def change
    add_column :designs, :default_price_rate, :decimal, default: 0.0
    add_column :glass_items, :default_price_rate, :decimal, default: 0.0
  end
end
