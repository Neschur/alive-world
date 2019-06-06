class WorldController < ApplicationController
  DEFAULT_UUID = '7cacfb9f-e711-4022-9f73-d6d6d979641a'

  def index
    store_world = get_world_from_db
    processor = LiveProcessor.new(store_world.load_world)
    new_world = processor.step
    store_world.save_world!(new_world)

    @world = new_world.to_json
  end

  private

  def get_world_from_db
    Store::World.where(id: DEFAULT_UUID).first || Store::World.create(id: DEFAULT_UUID, data: generate_world.to_json)
  end

  def generate_world
    world = WorldGenerator.new(size: { x: 30, y: 30 }).call
  end
end
