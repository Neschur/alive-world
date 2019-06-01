class WorldGenerator
  def initialize(size:)
    @size = size
  end

  def call
    ground = GroundGenerator.new(size: size).call
    World.new(ground)
  end

  private

  attr_reader :size
end
