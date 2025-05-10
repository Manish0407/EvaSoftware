class ProfileRmItemDetail < ApplicationRecord

	def self.ransackable_attributes(auth_object = nil)
    	["created_at", "cutting_blade_thickness", "id", "id_value", "reusable_offcut_length", "rm_code", "rm_item_name", "standard_bar_length", "standard_bar_total_trim_length", "updated_at"]
  	end
end
