class GlassItem < ApplicationRecord

	 # Presence validations
  validates :enternal_code, presence: { message: "Eternal Code cannot be blank" }
  validates :glass_code, presence: { message: "Glass Code cannot be blank" }
  validates :glass_name, presence: { message: "Glass Name cannot be blank" }
  validates :report_category, presence: { message: "Report Category cannot be blank" }
  validates :unit, presence: { message: "Unit cannot be blank" }
  validates :glass_alias, presence: { message: "Glass alias cannot be blank" }
  validates :glass_color, presence: { message: "Color cannot be blank" }
  validates :glass_weight, presence: { message: "Glass Weight cannot be blank" }
  validates :glass_thickness, presence: { message: "Glass Thickness cannot be blank" }
  validates :basic_value_in_sqFt, :basic_value_in_sqmt, presence: { message: "cannot be blank" }

  # Numericality validations
  validates :glass_thickness, numericality: { greater_than_or_equal_to: 0, allow_nil: true, message: "Glass Thickness must be a positive number" }
  validates :glass_weight, numericality: { greater_than_or_equal_to: 0, allow_nil: true, message: "Glass Weight must be a positive number" }
  validates :basic_value_in_sqmt, numericality: { greater_than_or_equal_to: 0, allow_nil: true, message: "Basic Value must be a positive number" }
  validates :basic_value_in_sqFt, numericality: { greater_than_or_equal_to: 0, allow_nil: true, message: "Basic Value must be a positive number" }

  # Inclusion validation for boolean
  validates :status, inclusion: { in: [true, false], message: "Status must be true or false" }

  has_many :window_items, as: :material, dependent: :destroy

  before_save :set_default_values

  private

  def set_default_values
    self.default_price_rate = self.total_glass_value || 0.0
  end
end
