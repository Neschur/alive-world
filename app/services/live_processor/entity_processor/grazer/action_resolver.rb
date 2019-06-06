class LiveProcessor
  class EntityProcessor
    module Grazer
      class ActionResolver
        def initialize(entity, view_field)
          @entity = entity
          @view_field = view_field
        end

        def call
          if rand(2) == 0
            random_move
          else
            eat
          end
        end

        private

        attr_reader :entity, :view_field

        def random_move
          {
            action: :move,
            options: {
              x: rand(3)-1,
              y: rand(3)-1,
            }
          }
        end

        def eat
          {
            action: :eat,
            options: {
              target: nil
            }
          }
        end
      end
    end
  end
end
