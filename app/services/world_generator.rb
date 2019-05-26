class WorldGenerator
  def initialize(size:)
    @size = size
  end

  def call
    ground = WorldGroundGenerator.new(size: size).call
    World.new(ground)
  end

  private

  attr_reader :size
end
