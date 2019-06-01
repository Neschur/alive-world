class WorldGenerator
  class GroundGenerator
    class PlantsGenerator < BaseGenerator
      GRASS_PROBABILITY = 0.88

      private

      def generate
        each_point do |_x, _y, point|
          if point.landscape == :land
            point.push_entity(Entity.new(:grass)) if turn_the_drum(GRASS_PROBABILITY)
          end
        end
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
