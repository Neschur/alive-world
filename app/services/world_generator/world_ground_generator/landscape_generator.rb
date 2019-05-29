class WorldGenerator
  class WorldGroundGenerator
    class LandscapeGenerator < BaseGenerator
      GRASS_PROBABILITY = 0.88
      STONE_PROBABILITY = 0.06

      def call
        each_point do |_x, _y, point|
          point.push_entity(base_random_entity)
        end

        each_point do |_x, _y, point|
          if point.landscape_entity.type == :land
            point.push_entity(Entity.new(:grass)) if turn_the_drum(GRASS_PROBABILITY)
          end
        end

        ground
      end

      private

      attr_reader :size

      def base_random_entity
        type = :land
        type = :stone if turn_the_drum(STONE_PROBABILITY)

        Entity.new(type)
      end

      def turn_the_drum(probability)
        rand < probability
      end
    end
  end
end
