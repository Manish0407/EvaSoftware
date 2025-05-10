class HardwarePrice < ApplicationRecord

	has_many :window_items, as: :material, dependent: :destroy

	def self.ransackable_attributes(auth_object = nil)
    	["brand_name", "created_at", "currency", "default_price_rate", "id", "id_value", "item_name", "rate_calculate_formula", "rm_code", "select_price_level", "unit", "updated_at", "weight_per_unit"]
  	end

end
