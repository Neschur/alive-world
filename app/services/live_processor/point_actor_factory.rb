class LiveProcessor
  class PointActorFactory
    ACTORS = {
      grazer: ::Actors::GrazerActor,
    }.freeze

    def initialize(point, world:, x:, y:)
      @point = point
      @world = world
      @x, @y = [x, y]
    end

    def actors
      point.entities.map do |entity|
        actor_class(entity).new(entity, world: world, x: x, y: y)
      end
    end

    private

    attr_reader :point, :world, :x, :y

    def actor_class(entity)
      ACTORS[entity.type] || Actors::NullActor
    end
  end
end
