class LiveProcessor
  class EntityProcessor
    module Grazer
      class ViewFieldGenerator
        def initialize(world, entity, x:, y:, radius:)
          @radius = radius
          @view_size = radius * 2
          @entity = entity
        end

        def call
          Field.new(ground)
        end

        private

        attr_reader :radius, :view_size, :entity

        def ground
          @ground ||= (0..view_size).map do |delta_x|
                        (0..view_size).map do |delta_y|
                          point_for(x - delta_x + radius, y - delta_y + radius)
                        end
                      end
        end

        def field
          @field ||= Array.new(5) { Array.new(5) }
        end

        def point_for(x, y)
          point = world[x, y].copy
          point.remove_entity!(entity)
          point
        end
      end
    end
  end
end
