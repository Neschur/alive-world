class PointValidator
  def initialize(entities_list)
    @entities_list = entities_list
  end

  def valid?
    landscape_is_valid? || not_two_grasses?
  end

  private

  def landscape_is_valid?
    entities_list.select { |e| Entity::LAND_TYPES.include?(e.type) }.size == 1
  end

  def not_two_grasses?
    entities_list.select { |e| e.is_a_type?(:grass) }.size <= 1
  end

  attr_reader :entities_list
end
