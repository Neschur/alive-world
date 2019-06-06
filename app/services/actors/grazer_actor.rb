module Actors
  class GrazerActor
    def initialize(entity, world:, x:, y:)
      @entity = entity
      @x, @y = x, y
    end

    def action_result
      {
        action: :move, # move, stay, eat
        options: [x + 1, y + 1],
      }
    end

    private

    attr_reader :word, :x, :y, :entity
  end
end
