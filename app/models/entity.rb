class Entity
  LAND_TYPES = [:land, :stone]
  TYPES = LAND_TYPES + [:grass, :grazer, :predator]
  DEFAULT_HEALTH = 100

  attr_reader :type
  attr_accessor :health

  def initialize(type, health: DEFAULT_HEALTH)
    validate(type)

    @type = type
    @health = health
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
