class WorldController < ApplicationController
  def index
    world = WorldGenerator.new(size: { x: 30, y: 30 }).call
    @world = WorldPresenter.new(world).data
  end
end
