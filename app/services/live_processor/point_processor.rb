class LiveProcessor
  class PointProcessor
    def initialze(point)
      @point = point
    end

    def actors
      process_each_entity
    end

    def process_each_entity
      point.entities.map do |entity|
        EntityProcessor.new(entity).actor
      end
    end
  end
end
