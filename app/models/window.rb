class Window < ApplicationRecord

    # Associations
    belongs_to :quote
    has_many :window_items, dependent: :destroy
    has_one_attached :image

    # Validations
    validates :name, presence: true
    validates :description, presence: true
    validates :quantity, numericality: { greater_than: 0 }

    # Callbacks
    before_create :set_default_quantity

    private
    def set_default_quantity
        self.quantity ||= 1
    end
end
