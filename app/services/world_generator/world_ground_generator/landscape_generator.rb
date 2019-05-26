class WorldGenerator
  class WorldGroundGenerator
    class LandscapeGenerator
      GRASS_PROBABILITY = 0.88
      STONE_PROBABILITY = 0.06

      def initialize(size:, ground: nil)
        @size = size
      end

      def call
        size[:x].times.map do
          size[:y].times.map do
            Entity.new(random_entity_type)
          end
        end
      end

      private

      attr_reader :size

      def random_entity_type
        return :grass if turn_the_drum(GRASS_PROBABILITY)
        return :stone if turn_the_drum(STONE_PROBABILITY)

        return :land
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
