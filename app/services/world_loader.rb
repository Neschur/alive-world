class WorldLoader
  def initialize(corral_id)
    @corral_id = corral_id
  end

  def load
    init_ground

    World.new(ground)
  end

  private

  attr_reader :corral_id, :ground

  def save_point!(x:, y:, entities:)

  end

  def init_ground
    @ground = sizex.times.map do |x|
      sizey.times.map do |y|
        xy_store_entityes(x: x, y: y).map do |store_entity|
          1/0
        end
      end
    end
  end

  def xy_store_entityes(x:, y:)
    Store::Entity.joins(:point).where(points: { x: x, y: y, corral_id: corral_id} )
  end

  def sizex
    Store::Point.where(corral_id: corral_id).maximum(:x)
  end

  def sizey
    Store::Point.where(corral_id: corral_id).maximum(:y)
  end
end
