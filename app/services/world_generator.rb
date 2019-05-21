class WorldGenerator
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
        Array.new
      end
    end
  end

  def make_world
    World.new(ground)
  end
end
