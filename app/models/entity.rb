class Entity
  LAND_TYPES = [:land, :stone]
  TYPES = LAND_TYPES + [:grass, :grazer, :predator]

  attr_reader :type

  def initialize(type)
    validate(type)

    @type = type
  end

  def is_a_type?(the_type)
    validate(the_type)

    type == the_type
  end

  private

  def validate(type)
    raise 'Not allowed type' unless TYPES.include?(type)
  end
end
