module Store
  class Point < ApplicationRecord
    self.table_name = :points

    has_many :entities
    belongs_to :corral
  end
end
