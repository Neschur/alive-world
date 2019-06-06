class LiveProcessor
  def initialize(world)
    @world = world
  end

  def step
    # @actors = collect_actors
    # process_actors
    world.each_point do |x, y, point|
      point.entities.each do |entity|
        next if entity.type == :grass

        work_with_entity(point, entity, x: x, y: y)
      end
    end

    world
  end

  private

  attr_accessor :world, :actors

  def work_with_entity(point, entity, x:, y:)
    view_field = get_entity_view_field(entity, x: x, y: y)
    action = get_action(entity, view_field)
    process_action(entity, action, x: x, y: y)
  end

  def get_entity_view_field(entity, x:, y:)
    view_size = 5
    radius = view_size / 2
    field = Array.new(5) { Array.new(5) }

    ground = (0..(view_size - 1)).map do |delta_x|
      (0..(view_size - 1)).map do |delta_y|
        current_x = x - delta_x + radius
        current_y = y - delta_y + radius

        point = world[current_x, current_y]

        if current_x == x && current_y == y
          point = point.copy
          point.remove_entity!(entity)
        end

        point
      end
    end

    Field.new(ground)
  end

  def get_action(entity, view_field)
    {
      action: :move,
      options: {
        x: rand(3)-1,
        y: rand(3)-1,
      }
    }
  end

  def process_action(entity, action_data, x:, y:)
    action = action_data
    options = action_data[:options]
    if action[:action] == :move
      world[x, y].remove_entity!(entity)
      world[x + options[:x], y + options[:y]].push_entity!(entity)
    else
      # YYY
    end
  end
end
