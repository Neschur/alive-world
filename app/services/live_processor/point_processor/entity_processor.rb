class LiveProcessor
  class PointProcessor
    class EntityProcessor
      def initialze(entity, world: x:, y:)
        @entity = entity
        @world = world
        @x, @y = x, y
      end

      def actor
        action_result = actor.call
        ActionProcessor.new(action_result)
      end

      def actor_class
        @actor_class ||= ACTORS[entity.type] || NullActor
      end

      def actor
        @actor ||= actor_class.new(world, x, y, entity)
      end
    end
  end
end
