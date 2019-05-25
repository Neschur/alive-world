class WorldPresenter
  def initialize(world)
    @world = world
  end

  def data
    @world.each
  end
end
