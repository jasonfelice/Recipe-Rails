class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :inventory_foods
end
