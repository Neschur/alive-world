class LiveProcessor
  ACTORS = {
    grazer: GrazerActor,
  }.freeze

  def initialize(world)
  end

  def step
    collect_actors
    process_actors
  end

  def collect_actors
    @actors = world.map do |x, y, point|
      collect_actors_for_point(x, y, point)
    end.flatten
  end

  def collect_actors_for_point(x, y, point)
    actors = PointProcessor.new(point).actors
    actors.map do
      {
        actor: actor,
        x: x,
        y: y,
      }
    end
  end

  def process_actors
    actors.map do |actor_data|
      result = actor.call
      ActionProcessor.new(result)
    end
  end
end
