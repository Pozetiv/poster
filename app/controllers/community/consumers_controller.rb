class Community::ConsumersController < ApplicationController
  before_action :set_community

  def index
    @consumers = @community.consummers.group(:role)
  end

  def new
    consumers_list = @communtiy.consumers.pluck(:user_id)
    @candidates = User.all.where.not(id: consumers_list)
  end

  def create
    @consumer = @community=.consumer.new(consumers_params)
    if @consumer.save
      render json {}, status: :ok
    else
      render json { error: @consumer.errors.message }, stauts: 402
    end
  end

  def update
    if @consumer.update(consumers_params)
      render json { consumer: @consumer }, status: :accept
    else
      render json { error:@consumer.erros.messages }, status: 402
  end

  def destroy
    if @consumer.destroy
      render json: {}, status: 204
    else
      render json, {}, status: 402
    end
  end

  private

  def set_community
    @community ||= Community.frendly.find(:community_id)
  end

  def set_consummer
    @consumer ||= set_community.consummers.find(params[:id])
  end

  def consumer_params
    params.require(:consumer).permit(:user_id, :role)
end
