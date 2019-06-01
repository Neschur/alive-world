class WorldGenerator
  class GroundGenerator
    class BaseGenerator
      def initialize(size:, data:)
        @size = size
        @data = data
      end

      def call
        generate

        data
      end

      private

      attr_reader :size, :data

      def generate
        raise NotImplementedError
      end

      def turn_the_drum(probability)
        rand < probability
      end

      def each_point
        data.each_with_index do |line, x|
          line.each_with_index do |point, y|
            yield(x, y, point)
          end
        end
      end
    end
  end
end
