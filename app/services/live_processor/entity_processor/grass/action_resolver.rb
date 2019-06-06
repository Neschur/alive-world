class LiveProcessor
  class EntityProcessor
    module Grass
      class ActionResolver
        def initialize(entity, view_field)
          @entity = entity
          @view_field = view_field
        end

        def call
          {
            action: :duplicate,
          }
        end
      end
    end
  end
end
