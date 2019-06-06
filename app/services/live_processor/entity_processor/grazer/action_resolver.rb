class LiveProcessor
  class EntityProcessor
    module Grazer
      class ActionResolver
        def initialize(entity, view_field)
          @entity = entity
          @view_field = view_field
        end

        def call
          {
            action: :move,
            options: {
              x: rand(3)-1,
              y: rand(3)-1,
            }
          }
        end

        private

        attr_reader :entity, :view_field
      end
    end
  end
end
