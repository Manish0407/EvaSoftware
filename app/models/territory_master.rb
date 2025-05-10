class TerritoryMaster < ApplicationRecord
	has_one :territory_location
	has_one :user_territory

	validates :territory_name, presence: { message: "Territory name is required" }
end
