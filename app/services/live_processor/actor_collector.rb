class LiveProcessor
  class ActorCollector
    def initialize(world)
      @world = world
    end

    def call
      world.map do |x, y, point|
        collect_actors_for_point(x, y, point)
      end.flatten
    end

    private

    attr_reader :world

    def collect_actors_for_point(x, y, point)
      PointActorFactory.new(point, world: world, x: x, y: y).actors
    end
  end
end
