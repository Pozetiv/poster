class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[edit update show destroy]
  # def index

  # end

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

  def show; end
  
  def destroy
    redirect_to communities_path if @community.destroy
  end

  private

  def communities_params
    params.require(:community).permit(:title, :description, :logo, :category, :private)
  end

  def set_community
    @community = Community.friendly.find(params[:id])
  end
end
