class WorldGenerator
  class GroundGenerator
    class LandscapeGenerator < BaseGenerator
      STONE_PROBABILITY = 0.06

      private

      def generate
        @data = init_each_point do |_x, _y, point|
          Point.new(random_landscape)
        end
      end

      def random_landscape
        return :stone if turn_the_drum(STONE_PROBABILITY)

        return :land
      end

      def init_each_point
        size[:x].times.map do |line, x|
          size[:y].times.map do |point, y|
            yield(x, y)
          end
        end
      end
    end
  end
end
