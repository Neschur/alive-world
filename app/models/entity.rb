class Entity
  TYPES = [:land, :stone, :grass, :grazer, :predator]

  attr_reader :type

  def initialize(type)
    validate(type)

    @type = type
  end

  private

  def validate(type)
    raise 'Not allowed type' unless TYPES.include?(type)
  end
end
