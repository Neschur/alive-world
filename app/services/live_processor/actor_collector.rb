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

    def collect_actors_for_point(point)
      PointActorFactory.new(point).actors
    end
  end
end
