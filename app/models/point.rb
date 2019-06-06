class Point
  def initialize(landscape)
    @entities = []
    @landscape = landscape
  end

  attr_reader :entities, :landscape

  def push_entity!(entity)
    # validate_entites_list(entities + [entity])
    entities.push(entity)
  end

  def copy
    new_point = Point.new(landscape)
    entities.each do |entity|
      new_point.push_entity!(entity)
    end

    new_point
  end

  def remove_entity!(entity)
    @entities = entities.reject { |e| e == entity }
  end

  private

  # def validate_entites_list(new_entities)
  #   raise unless PointValidator.new(new_entities).valid?
  # end
end
