class LiveProcessor
  class EntityProcessor
    module Grazer
      class ActionProcessor
        class Eat
          CONSUME_PROFIT = 1

          def initialize(entity, source_point:, target_point:)
            @entity = entity
            @source_point = source_point
            @target_point = target_point
          end

          def call
            grass = source_point.entities.find { |e| e.type == :grass }
            return unless grass

            source_point.remove_entity!(grass)
            entity.health += CONSUME_PROFIT
            entity.health = 100 if entity.health > 100
          end

          private

          attr_reader :entity, :target_point, :source_point
        end
      end
    end
  end
end
