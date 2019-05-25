class WorldPresenter
  COLOURS = {
    land: '#c17e00',
    stone: '#4e4431',
    grass: '#00ac17',
    grazer: '#275fe2',
    predator: '#9014c1',
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
