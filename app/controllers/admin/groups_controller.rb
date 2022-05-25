class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @group = Group.new
  end


  def index
    @group = Group.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path
    else
      flash[:error] = "店舗名を入力してください。"
      redirect_to admin_groups_path
    end
  end


  def show
    @group = Group.find(params[:id])
    @members = @group.members.where(is_active: true)
  end

  def edit
    @group = Group.find(params[:id])
  end


  private

  def group_params
    params.require(:group).permit(:admin_id, :shop_name)
  end
end
