class LiveProcessor
  class PointProcessor
    class EntityProcessor
      ACTORS = {
        grazer: ::Actors::GrazerActor,
      }.freeze

      def initialize(entity)
        @entity = entity
      end

      def actor_data
        # action_result = actor.call
        # ActionProcessor.new(action_result)
        {
          actor_class: actor_class,
          entity: entity,
        }
      end

      private

      attr_reader :entity

      def actor_class
        @actor_class ||= ACTORS[entity.type] || Actors::NullActor
      end

      # def actor
      #   @actor ||= actor_class
      # end
    end
  end
end
