class Point
  def initialize
    @entities = []
  end

  def push_entity(entity)
    validate_entites_list(entities + [entity])
    entities.push(entity)
  end

  def active_entities?
    active_entities.present?
  end

  def active_entities
    entities.reject { |e| Entity::LAND_TYPES.include?(e.type) }
  end

  def landscape_entity
    entities.find { |e| Entity::LAND_TYPES.include?(e.type) }
  end

  private

  attr_reader :entities

  def validate_entites_list(new_entities)
    raise unless PointValidator.new(new_entities).valid?
  end
end
