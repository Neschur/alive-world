module Actors
  class NullActor
    def initialize(entity, world:, x:, y:)
      @world = world
      @x, @y = x, y
      @entity = entity
    end

    def action_result
      {
        action: :stay,
      }
    end

    private

    attr_reader :word, :x, :y, :entity
  end
end
