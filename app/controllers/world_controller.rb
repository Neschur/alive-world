class WorldController < ApplicationController
  DEFAULT_UUID = '7cacfb9f-e711-0100-0000-d6d6d979641a'

  def index
    @world = world.to_json

    render :show
  end

  def show
    @world = world.to_json

    render :show
  end

  private

  def world
    processor = LiveProcessor.new(store_world.load_world)
    100.times { processor.step }
    new_world = processor.step
    store_world.save_world!(new_world)

    new_world
  end

  def store_world
    Store::World.where(id: uuid).first || Store::World.create(id: uuid, data: generate_world.to_json)
  end

  def generate_world
    world = WorldGenerator.new(size: { x: 20, y: 20 }).call
  end

  def uuid
    raise unless validate_uuid_format(params['id'])

    params['id'] || DEFAULT_UUID
  end

  def validate_uuid_format(uuid)
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    uuid_regex.match?(uuid.to_s.downcase)
  end
end
