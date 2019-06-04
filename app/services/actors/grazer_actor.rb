class GrazerActor
  def initialize(world, x:, y:, entity:)
    @world = world
    @x, @y = x, y
    @entity = entity
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
