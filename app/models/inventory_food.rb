class InventoryFood < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :inventory
  belongs_to :food
end
