class WorldGenerator
  class GroundGenerator
    class GrazersGenerator < BaseGenerator
      private

      def generate
        each_point do |_x, _y, point|
          entity = random_entity

          point.push_entity!(entity) if entity
        end
      end

      def random_entity
        type = :grazer if turn_the_drum(0.003)

        Entity.new(type) if type
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
