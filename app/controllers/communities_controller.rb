class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[edit update show destroy]

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.new(communities_params)
    if @community.save
      redirect_to @community
    else
      rednder :new
    end
  end

  def edit; end

  def update
    if @community.update(communities_params)
      redirect_to @community
    else
      render :edit
    end
  end

  def show
    @posts = @community.posts
  end

  def destroy
    redirect_to communities_path if @community.destroy
  end

  def subscribes
    community_subscribes.includes(:user)
  end

  def approve
    community_subscribes.where(id: params[:subsribe_id])
  end

  # def destroy_subscribe

  private

  def communities_params
    params.require(:community).permit(:title, :description, :logo, :category, :private)
  end

  def set_community
    @community ||= Community.friendly.find(params[:id])
  end

  def community_subscribes
    @subscribes ||= @community.subscribses
  end
end
