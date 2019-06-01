class GrazerActor
  def initialize(corral, x:, y:, entity:)
    @corral = corral
    @x = x
    @y = y
    @entity = entity
  end

  def act
    filter_field_of_view
  end

  private

  def filter_field_of_view
    corral.corract
  end

  def radius
    3
  end

  attr_reader :corral, :x, :y, :entity
end
