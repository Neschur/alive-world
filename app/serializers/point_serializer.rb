class PointSerializer
  def initialize(point)
    @point = point
  end

  def to_hash
    {
      landscape: point.landscape,
      entities: entities,
    }
  end

  private

  attr_reader :point

  def entities
    point.entities.map do |entity|
      EntitySerializer.new(entity).to_hash
    end
  end
end
