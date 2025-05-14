class WindowItem < ApplicationRecord

    # Associations
    belongs_to :window
    belongs_to :material, polymorphic: true

    validates :quantity, numericality: { greater_than: 0 }

    def base_price
        case material
        when GlassItem
            material.basic_value_in_sqFt # or sqmt, depending on your logic
        when ReinforcementPrice, HardwarePrice
            material.default_price_rate
        else
            0
        end
    end

    def final_price
        (negotiated_price || base_price.to_f) * quantity
    end
end
