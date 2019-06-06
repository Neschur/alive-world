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

        def action_move
          return unless target_point && target_point.landscape == :land

          source_point.remove_entity!(entity)
          target_point.push_entity!(entity)
          entity.action_done(:move)
        end
      end
    end
  end
end
