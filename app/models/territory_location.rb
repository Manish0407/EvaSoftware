class TerritoryLocation < ApplicationRecord
	belongs_to :territory_master

	validates :territory_master_id, presence: { message: "Territory name is required" }
  	validates :hierarchical_geography, presence: { message: "Hierarchical geography is required" }
end
