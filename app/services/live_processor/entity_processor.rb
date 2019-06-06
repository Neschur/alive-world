class LiveProcessor
  class EntityProcessor
    def initialize(world, entity, x: x, y: y)
      @world = world
      @entity = entity
      @x, @y = x, y
    end

    # TODO - to another class, refactor
    def view_field
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

    # TODO - to another class, refactor
    def get_action(view_field)
      {
        action: :move,
        options: {
          x: rand(3)-1,
          y: rand(3)-1,
        }
      }
    end

    # TODO - to another class, refactor
    def do_action(action_data)
      action = action_data
      options = action_data[:options]
      if action[:action] == :move && world[x + options[:x], y + options[:y]]
        world[x, y].remove_entity!(entity)
        world[x + options[:x], y + options[:y]].push_entity!(entity)
      else
        # YYY
      end
    end

    private

    attr_reader :world, :entity, :x, :y
  end
end
