module Store
  class Point < ApplicationRecord
    self.table_name = :points

    belongs_to :entity
    belongs_to :corral
  end
end
