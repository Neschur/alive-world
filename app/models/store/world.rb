class Store::World < ApplicationRecord
  validates :data, presence: true
end
