class WorldGenerator
  GRASS_PROBABILITY = 0.88
  STONE_PROBABILITY = 0.06

  def initialize(sizex:, sizey:)
    @sizex = sizex
    @sizey = sizey
  end

  def call
    generate_base

    make_world
  end

  private

  attr_reader :sizex, :sizey, :ground

  def generate_base
    @ground = sizex.times.map do
      sizey.times.map do
        entity_type = :land
        entity_type = :grass if turn_the_drum(GRASS_PROBABILITY)
        entity_type = :stone if turn_the_drum(STONE_PROBABILITY)

        Entity.new(entity_type)
      end
    end
  end

  def make_world
    World.new(ground)
  end

  def turn_the_drum(probability)
    rand < probability
  end
end
