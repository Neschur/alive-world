class GroundSerializer
  def initialize(ground)
    @ground = ground
  end

  def to_hash
    {
      landscape: ground.landscape,
      entities: entities,
    }
  end

  private

  attr_reader :ground

  def entities
    ground.entities.map do |entity|
      EntitySerializer.new(entity).to_hash
    end
  end
end
