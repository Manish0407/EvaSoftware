class Location < ApplicationRecord
    validates :city, presence: { message: "City is required" }
	validates :state, presence: { message: "State is required" }
  	validates :country, presence: { message: "Location country is required" }
end
