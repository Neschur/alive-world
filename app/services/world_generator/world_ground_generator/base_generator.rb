class WorldGenerator
  class WorldGroundGenerator
    class BaseGenerator
      def initialize(size:, ground:)
        @size = size
        @ground = ground
      end

      def call
        raise NotImplementedError
      end

      private

      attr_reader :size, :ground

      def turn_the_drum(probability)
        rand < probability
      end

      def each_point
        ground.each_with_index do |line, x|
          line.each_with_index do |point, y|
            yield(x, y, point)
          end
        end
      end
    end
  end
end
