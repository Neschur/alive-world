class WorldPersister
  def initialize(world)
    @world = world
  end

  def save!
    ActiveRecord::Base.transaction do
      @store_corral = Store::Corral.create!

      world.ground.each_with_index do |line, x|
        line.each_with_index do |entity, y|
          save_point!(x: x, y: y, entity: entity)
        end
      end
    end
  end

  private

  attr_reader :world, :store_corral

  def save_point!(x:, y:, entity:)
    store_point = Store::Point.create!(x: x, y: y, corral_id: corral.id, entity_id: store_entity)
  end
end
