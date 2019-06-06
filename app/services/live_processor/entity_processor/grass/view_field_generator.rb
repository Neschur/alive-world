class LiveProcessor
  class EntityProcessor
    module Grass
      class ViewFieldGenerator
        def initialize(world, entity, x:, y:, radius:)
          @radius = radius
          @view_size = radius * 2
          @entity = entity
        end

        def call
          Field.new([[]])
        end
      end
    end
  end
end
