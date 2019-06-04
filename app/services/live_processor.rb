class LiveProcessor
  def initialize(world)
    @world = world
  end

  def step
    @actors = collect_actors
    process_actors
  end

  private

  attr_accessor :world, :actors

  def collect_actors
    ActorCollector.new(world).call
  end

  def process_actors
    actors.map do |actors|
      binding.pry
    end
  end
end
