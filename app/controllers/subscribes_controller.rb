class SubscribesController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscribes = current_user.subscribes
  end

  def create
    @subscribe = current_user.subscribes.new(subscribe_params)
    @subscribe.save
  end

  def destroy
    redirect_back(fallback_location: root_path) if set_subscribe.destroy
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:subscible_id, :subscible_type)
  end

  def set_subscribe
    @subscribe = current_user.subscribes.find(params[:id])
  end
end
