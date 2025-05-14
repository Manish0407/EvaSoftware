class Window < ApplicationRecord

    # Associations
    belongs_to :design
    belongs_to :quote
    has_many :window_items, dependent: :destroy

end
