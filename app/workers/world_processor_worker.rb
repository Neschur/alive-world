class WorldProcessorWorker
  include Sidekiq::Worker

  DEFAULT_DELAY = 0.1

  sidekiq_options lock: :until_and_while_executing, unique_args: :unique_args

  def self.unique_args(args)
    [args[0]]
  end

  def perform(world_id, options = {})
    @world_id = world_id
    steps = options.fetch('steps', 1)
    delay = options.fetch('delay', DEFAULT_DELAY)

    processor = LiveProcessor.new(store_world.load_world)

    result = nil
    while steps > 0
      execute_with_delay(delay) do
        result = processor.step
        send_data(result.to_json, last_step: steps <= 1)
        steps -= 1
      end
    end

    store_world.save_world!(result);
  end

  private

  attr_reader :world_id

  def send_data(world_data, last_step:)
    # TODO: Move to worker
    ActionCable.server.broadcast 'world_updater', world: world_data, world_id: world_id, last_step: last_step
  end

  def store_world
    Store::World.where(id: world_id).first || Store::World.create(id: world_id, data: generate_world.to_json)
  end

  def generate_world
    world = WorldGenerator.new(size: { x: 40, y: 40 }).call
  end

  def execute_with_delay(delay)
    start_time = current_time
    yield
    still_delay = delay - (current_time - start_time)
    sleep(still_delay) if still_delay > 0
  end

  def current_time
    Time.now.to_f
  end
end
