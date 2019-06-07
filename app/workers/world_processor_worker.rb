class WorldProcessorWorker
  include Sidekiq::Worker

  sidekiq_options lock: :until_and_while_executing, unique_args: :unique_arg

  def self.unique_args(args)
    [args[0]]
  end

  def perform(world_id, still = 200)
    @world_id = world_id

    processor = LiveProcessor.new(store_world.load_world)
    result = processor.step
    send_data(result.to_json)
    store_world.save_world!(result);

    if still > 0
      sleep(0.1)
      WorldProcessorWorker.perform_async(world_id, still - 1)
    end
  end

  private

  attr_reader :world_id

  def send_data(world_data)
    # TODO: Move to worker
    ActionCable.server.broadcast 'world_updater', world: world_data, world_id: world_id
  end

  def store_world
    Store::World.where(id: world_id).first || Store::World.create(id: world_id, data: generate_world.to_json)
  end

  def generate_world
    world = WorldGenerator.new(size: { x: 20, y: 20 }).call
  end
end
