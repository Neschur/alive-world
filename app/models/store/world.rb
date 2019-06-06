class Store::World < ApplicationRecord
  validates :data, presence: true

  def save_world!(world)
    update(data: world.to_json)
  end

  def load_world
    parsed_data = JSON.parse(data, symbolize_names: true)
    Loader.new(parsed_data).call
  end
end
