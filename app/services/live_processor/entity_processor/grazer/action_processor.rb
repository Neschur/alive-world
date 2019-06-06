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
          action_class.new(entity, source_point: source_point, target_point: target_point).call
        end

        private

        attr_reader :entity, :action, :options, :world, :x, :y

        def target_point
          return unless options[:x] || options[:y]
          world[x + options[:x], y + options[:y]]
        end

        def source_point
          world[x, y]
        end

        def action_class
          "#{self.class.name}::#{action.to_s.camelize}".constantize
        end
      end
    end
  end
end
