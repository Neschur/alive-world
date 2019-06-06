class LiveProcessor
  class EntityProcessor
    module Grazer
      class ActionProcessor
        class Move
          STEP_COST = 1

          def initialize(entity, source_point:, target_point:)
            @entity = entity
            @source_point = source_point
            @target_point = target_point
          end

          def call
            return unless target_point && target_point.landscape == :land
            return if source_point == target_point

            source_point.remove_entity!(entity)
            entity.health -= STEP_COST
            target_point.push_entity!(entity) if entity.health.positive?
          end

          private

          attr_reader :entity, :target_point, :source_point
        end
      end
    end
  end
end
