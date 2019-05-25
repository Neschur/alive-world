class WorldController < ApplicationController
  def index
    world = WorldGenerator.new(sizex: 30, sizey: 30).call
    @world = WorldPresenter.new(world).data
  end
end
