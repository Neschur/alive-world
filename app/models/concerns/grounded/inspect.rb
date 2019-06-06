module Grounded
  module Inspect
    class AsciiDrawer
      LANDSCAPES = {
        land: '#',
        stone: '&',
      }

      ENTITIES = {
        grass: '*',
        grazer: '@',
        predator: '¥',
      }

      attr_reader :ground, :prefix

      def initialize(ground, prefix)
        @ground = ground
        @prefix = prefix
      end

      def call
        prefix + "\n" +
        ground.map do |line|
          line.map do |point|
            next ' ' unless point
            landscape = LANDSCAPES[point.landscape]
            important_points = point.entities.reject { |e| e.type == :grass }
            symbol = if important_points.size > 1
                      'X'
                    elsif important_points.present?
                      ENTITIES[important_points.first.type]
                    else
                      ENTITIES[point.entities.first&.type]
                    end
            symbol || landscape
          end.join
        end.join("\n")
      end
    end

    def inspect
      AsciiDrawer.new(ground, to_s).call
    end

    def to_s
      "#<#{self.class.name} #{size}>"
    end
  end
end
