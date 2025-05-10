class SalesOffice < ApplicationRecord
	
	validates :sales_office_name, presence: { message: "sales office name is required" }
end
