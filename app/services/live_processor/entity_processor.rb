class LiveProcessor
  class EntityProcessor
    def initialize(world, entity, x: x, y: y)
      @world = world
      @entity = entity
      @x, @y = x, y
    end

    def view_field
      view_field_generator.new(world, entity, x: x, y: y, radius: 2)
    end

    def get_action(view_field)
      action_resolver.new(entity, view_field).call
    end

    # TODO - to another class, refactor
    def do_action(action_data)
      action_processor.new(entity, world: world, action_data: action_data, x:  x, y: y)
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

    def view_field_generator
      entity_processor_class('ViewFieldGenerator')
    end

    def action_resolver
      entity_processor_class('ActionResolver')
    end

    def action_processor
      entity_processor_class('ActionProcessor')
    end

    def entity_processor_class(class_type)
      entity_type_string = entity.type.to_s.camelize
      "::LiveProcessor::EntityProcessor::#{entity_type_string}::#{class_type}".constantize
    end
  end
end
