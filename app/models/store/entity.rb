module Store
  class Entity < ApplicationRecord
    self.table_name = :entities

    has_one :point
  end
end
