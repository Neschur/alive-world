class WorldGenerator
  class WorldGroundGenerator
    def initialize(size:, ground: nil)
      @size = size
    end

    def call
      ground = generate_base
      ground = generate_landscape(ground)
      ground = generate_grazers(ground)

      ground
    end

    private

    attr_reader :size

    def generate_base
      size[:x].times.map do
        size[:y].times.map do
          []
        end
      end
    end

    def generate_landscape(ground)
      LandscapeGenerator.new(size: size, ground: ground).call
    end

    def generate_grazers(ground)
      GrazersGenerator.new(size: size, ground: ground).call
    end
  end
end
