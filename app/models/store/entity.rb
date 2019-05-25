module Store
  class Entity < ApplicationRecord
    has_one :point
  end
end
