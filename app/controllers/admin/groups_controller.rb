class Admin::GroupsController < ApplicationController

  def new
  end


  def index
    @group_new = Group.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to admin_groups_path
  end


  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end


  private

  def group_params
    params.require(:group).permit(:shop_name, :shop_image)
  end
end
