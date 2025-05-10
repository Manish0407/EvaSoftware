class WindowItem < ApplicationRecord

    # Associations
    belongs_to :window
    belongs_to :material, polymorphic: true

end
