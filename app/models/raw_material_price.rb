class RawMaterialPrice < ApplicationRecord
	has_one_attached :price_file
	has_many :window_items, as: :material, dependent: :destroy

  	def self.ransackable_attributes(auth_object = nil)
    	super + ['rm_code', 'item_name', 'brand_name', 'unit']
  	end
end
