class UserTerritory < ApplicationRecord
	belongs_to :territory_master

	validates :territory_master_id, presence: { message: "Territory name is required" }
	validates :employee_id, presence: { message: "employee name is required" }
end

