class Window < ApplicationRecord

    # Associations
    belongs_to :design
    belongs_to :account
    has_many :window_items, dependent: :destroy

end
