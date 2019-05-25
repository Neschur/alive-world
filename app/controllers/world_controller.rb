class WorldController < ApplicationController
  def index
    world = WorldGenerator.new(sizex: 10, sizey: 10).call
    @world = WorldPresenter.new(world).data
  end
end
