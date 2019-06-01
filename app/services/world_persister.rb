class WorldPersister
  def initialize(world)
    @world = world
  end

  def save!
    Store::World.create!(data: world.to_json)
  end
end
