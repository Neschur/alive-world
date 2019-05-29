module Store
  class Entity < ApplicationRecord
    self.table_name = :entities

    belongs_to :point
  end
end
