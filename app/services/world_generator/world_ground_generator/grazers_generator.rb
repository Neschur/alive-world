class WorldGenerator
  class WorldGroundGenerator
    class GrazersGenerator < BaseGenerator
      def call
        each_point do |_x, _y, entities|
          [random_entity(entities)].compact
        end
      end

      private

      attr_reader :size, :ground

      def random_entity(default_entity)
        type = :grazer if turn_the_drum(0.003)

        Entity.new(type) if type
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
