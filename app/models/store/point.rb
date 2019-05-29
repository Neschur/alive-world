module Store
  class Point < ApplicationRecord
    has_many :entities
    belongs_to :corral
  end
end
