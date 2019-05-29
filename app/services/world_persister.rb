class WorldPersister
  def initialize(world)
    @world = world
  end

  def save!
    ActiveRecord::Base.transaction do
      store_world = Store::Corral.create!
      @store_corral = Store::Corral.create!(world_id: store_world.id)

      world.ground.each_with_index do |line, x|
        line.each_with_index do |entities, y|
          save_point!(x: x, y: y, entities: entities)
        end
      end
    end
  end

  private

  attr_reader :world, :store_corral

  def save_point!(x:, y:, entities:)
    store_point = Store::Point.create!(x: x, y: y, corral_id: store_corral.id)

    entities.each do |entity|
      Store::Entity.create!(entity_type: entity.type, point: store_point)
    end
  end
end
