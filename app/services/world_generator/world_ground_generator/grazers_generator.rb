class WorldGenerator
  class WorldGroundGenerator
    class GrazersGenerator
      def initialize(size:, ground: nil)
        @size = size
        @ground = ground
      end

      def call
        ground.map do |line|
          line.map do |entity|
            random_entity(entity)
          end
        end
      end

      private

      attr_reader :size, :ground

      def random_entity(default_entity)
        type = :grazer if turn_the_drum(0.003)

        if type
          Entity.new(type)
        else
          return default_entity
        end
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
