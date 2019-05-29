class WorldPersister
  def initialize(world)
    @world = world
  end

  def save!
    ActiveRecord::Base.transaction do
      store_world = Store::Corral.create!
      @store_corral = Store::Corral.create!(world_id: store_world.id)

      world.ground.each_with_index do |line, x|
        line.each_with_index do |point, y|
          save_point!(x: x, y: y, point: point)
        end
      end
    end
  end

  private

  attr_reader :world, :store_corral

  def save_point!(x:, y:, point:)
    store_point = Store::Point.create!(x: x, y: y, corral_id: store_corral.id)

    Store::Entity.create!(entity_type: point.landscape_entity.type, point: store_point)
    point.active_entities.each do |entity|
      Store::Entity.create!(entity_type: entity.type, point: store_point)
    end
  end
end
