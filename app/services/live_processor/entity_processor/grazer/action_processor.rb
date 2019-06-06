class LiveProcessor
  class EntityProcessor
    module Grazer
      class ActionProcessor
        def initialize(entity, world:, action_data:, x:, y:)
          @entity = entity
          @world = world
          @action = action_data[:action]
          @options = action_data[:options]
          @x, @y = x, y
        end

        def call
          case action
          when :move
            action_move
          when :eat
            action_eat
          end
        end

        private

        attr_reader :entity, :action, :options, :world, :x, :y

        def target_point
          world[x + options[:x], y + options[:y]]
        end

        def source_point
          world[x, y]
        end

        # TODO: refactor actions
        def action_move
          return unless target_point && target_point.landscape == :land

          source_point.remove_entity!(entity)
          entity.health -= 1
          target_point.push_entity!(entity) if entity.health.positive?
        end

        def action_eat
          # TODO: move to another class
          grass = source_point.entities.find { |e| e.type == :grass }
          return unless grass

          source_point.remove_entity!(grass)
          entity.health += 5
        end
      end
    end
  end
end
