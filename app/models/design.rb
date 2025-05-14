class Design < ApplicationRecord
  
  has_many :windows, dependent: :destroy
  has_many :glass_items, as: :material, dependent: :destroy

  before_save :set_default_values

  private

  def set_default_values
    self.default_price_rate = self.price || 0.0
  end
end