class LiveProcessor
  class EntityProcessor
    module Grass
      class ActionProcessor
        def initialize(entity, world:, action_data:, x:, y:)
          @entity = entity
          @world = world
          @action = action_data[:action]
          @options = action_data[:options]
          @x, @y = x, y
        end

        def call
          return unless target_point
          return if target_point.landscape != :land
          return if target_point.entities.find { |e| e.type == :grass }
          return if rand(500) > 4

          target_point.push_entity!(Entity.new(:grass))
        end

        private

        attr_reader :entity, :action, :options, :world, :x, :y

        def target_point
          return @target_point if defined? @target_point

          @target_point ||= world[x + rand(3) - 1, y + rand(3) - 1]
        end

        def source_point
          world[x, y]
        end
      end
    end
  end
end
