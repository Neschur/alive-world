module Store
  class Point < ApplicationRecord
    belongs_to :entity
    belongs_to :corral
  end
end
