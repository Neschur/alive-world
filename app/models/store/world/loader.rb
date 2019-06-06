class Store::World < ApplicationRecord
  class Loader

    def initialize(data)
      @world_data = data
    end

    def call
      world(@world_data)
    end

    def world(data)
      ::World.new(ground(data[:ground]))
    end

    def ground(data)
      data.map do |line|
        line.map do |point_data|
          point(point_data)
        end
      end
    end

    def point(data)
      point = Point.new(data[:landscape].to_sym)

      data[:entities].each do |entity_data|
        point.push_entity!(entity(entity_data))
      end

      point
    end

    def entity(data)
      Entity.new(data[:type].to_sym)
    end
  end
end
