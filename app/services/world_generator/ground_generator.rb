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
      ground_data = nil
      GENERATORS_LIST.each do |generator|
        ground_data = generator.new(size: size, data: ground_data).call
      end

      Ground.new(ground_data)
    end

    private

    attr_reader :size
  end
end
