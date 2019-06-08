class WorldController < ApplicationController
  def index
    redirect_to world_path(SecureRandom.uuid)
  end

  def show
    @world_uuid = uuid

    WorldProcessorWorker.perform_async(uuid, steps: 10)

    render :show
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
end
