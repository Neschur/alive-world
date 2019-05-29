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
      line.map do |point|
        mark = point.landscape_entity.type

        if point.active_entities?
          entity = point.active_entities.find { |e| e.type == :grazer } || point.active_entities.first
          mark = entity.type
        end

        mark
      end
    end
  end
end
