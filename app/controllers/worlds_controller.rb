class WorldsController < ApplicationController
  helper_method :create_params_permitter
  helper_method :update_params_permitter

  def index
    render :index
  end

  def create
    world = Store::World.create(data: generate_world.to_json)

    redirect_to world_path(world.id)
  end

  def show
    @world_uuid = uuid

    WorldProcessorWorker.perform_async(uuid, steps: 10)

    render :show
  end

  def update
    WorldProcessorWorker.perform_async(uuid, permited_update_params)
  end

  private

  def uuid
    raise unless validate_uuid_format(params['id'])

    params['id']
  end

  def validate_uuid_format(uuid)
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    uuid_regex.match?(uuid.to_s.downcase)
  end

  def permited_update_params
    @permited_create_params ||= update_params_permitter.new(params).permitted_params
  end

  def permited_create_params
    @permited_create_params ||= create_params_permitter.new(params).permitted_params
  end

  def create_params_permitter
    ParamsPermitter::World::Create
  end

  def update_params_permitter
    ParamsPermitter::World::Update
  end

  def generate_world
    world = WorldGenerator.new(size: { x: permited_create_params[:xx], y: permited_create_params[:yy] }).call
  end
end
