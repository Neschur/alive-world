class EntitySerializer
  def initialize(entity)
    @entity = entity
  end

  def to_hash
    {
      type: entity.type,
    }
  end

  private

  attr_reader :entity
end
