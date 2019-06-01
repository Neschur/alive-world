class WorldSerializer
  def initialize(world)
    @world = world
  end

  def to_hash
    binding.pry
    # {
    #   ground: ground,
    # }
  end

  private

  attr_reader :world

  def ground
    # GroundSerializer.new(world.ground).to_hash
  end
end
