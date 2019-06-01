class WorldController < ApplicationController
  def index
    world = WorldGenerator.new(size: { x: 30, y: 30 }).call
    @world = world.to_json
  end
end
