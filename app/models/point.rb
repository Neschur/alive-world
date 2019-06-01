class Point
  def initialize(landscape)
    @entities = []
    @landscape = landscape
  end

  attr_reader :entities, :landscape

  def push_entity(entity)
    # validate_entites_list(entities + [entity])
    entities.push(entity)
  end

  private

  # def validate_entites_list(new_entities)
  #   raise unless PointValidator.new(new_entities).valid?
  # end
end
