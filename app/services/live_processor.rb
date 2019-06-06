class LiveProcessor
  def initialize(world)
    @world = world
  end

  def step
    world.each_point do |x, y, point|
      point.entities.each do |entity|
        work_with_entity(entity, x: x, y: y)
      end
    end

    world
  end

  private

  attr_accessor :world, :actors

  def work_with_entity(entity, x:, y:)
    entity_processor = make_entity_processor(entity, x: x, y: y)

    view_field = entity_processor.view_field
    action_data = entity_processor.get_action(view_field)
    entity_processor.do_action(action_data)
  end

  def make_entity_processor(entity, x:, y:)
    EntityProcessor.new(world, entity, x: x, y: y)
  end
end
