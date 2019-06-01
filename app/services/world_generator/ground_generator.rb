class WorldGenerator
  class GroundGenerator
    GENERATORS_LIST = [
      LandscapeGenerator,
      PlantsGenerator,
      GrazersGenerator,
    ]

    def initialize(size:)
      @size = size
    end

    def call
      ground = nil
      GENERATORS_LIST.each do |generator|
        ground = generator.new(size: size, data: ground).call
      end

      ground
    end

    private

    attr_reader :size
  end
end
