class WorldSerializer
  def initialize(world)
    @world = world
  end

  def save!
    ActiveRecord::Base.transaction do
      corral = Store::Corral.create!

      world.ground.each_with_index do |line, x|
        line.each_with_index do |entities, y|
          save_point!(x: x, y: y, entities: entities, corral: corral)
        end
      end
    end
  end

  private

  attr_reader :world

  def save_point!(x:, y:, entities:, corral:)
    store_point = Store::Point.create!(x: x, y: y, corral_id: corral.id)

    entities.each do |entity|
      store_entity = Store::Entity.create(point_id: store_point.id)
      # Store::EntityPoint.create!(entity_id: store_entity.id, point_id: store_point.id)
    end
  end
end
