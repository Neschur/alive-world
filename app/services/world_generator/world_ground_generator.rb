class WorldGenerator
  class WorldGroundGenerator
    def initialize(size:, ground: nil)
      @size = size
    end

    def call
      ground = generate_landscape
      ground = generate_grazers(ground)

      ground
    end

    private

    attr_reader :size

    def generate_landscape
      LandscapeGenerator.new(size: size).call
    end

    def generate_grazers(ground)
      GrazersGenerator.new(size: size, ground: ground).call
    end
  end
end
