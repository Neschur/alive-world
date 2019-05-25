class WorldPresenter
  COLOURS = {
    land: '#00ac17',
  }

  def initialize(world)
    @world = world
  end

  def data
    @world.ground.map do |line|
      line.map do |entity|
        COLOURS[entity.type.to_sym]
      end
    end
  end
end
