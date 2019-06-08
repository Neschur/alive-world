class WorldController < ApplicationController
  def index
    redirect_to world_path(SecureRandom.uuid)
  end

  def show
    @world_uuid = uuid

    WorldProcessorWorker.perform_async(uuid, steps: 10)

    render :show
  end

  def update
    WorldProcessorWorker.perform_async(uuid, permited_update_params.to_hash)
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
    permited_params = params.permit(:steps, :delay).reject { |k, v| v.blank? }
    permited_params[:steps] = permited_params[:steps].to_i
    permited_params[:delay] = permited_params[:delay].to_i

    permited_params
  end
end
