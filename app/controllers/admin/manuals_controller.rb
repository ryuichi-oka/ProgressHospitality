class Admin::ManualsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @manual = Manual.new
    @group = Group.find(params[:group_id])
  end

  def create
    @manual = Manual.new(manual_params)
    @group = @manual.group
    if @manual.save
      redirect_to admin_manuals_path(group_id: @group.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to new_admin_manual_path(group_id: @group.id)
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @manuals = @group.manuals.where(group_id: @group.id)
  end

  def show
    @manual = Manual.find(params[:id])
    @group = @manual.group
    @files = params[:files]
  end

  def edit
    @manual = Manual.find(params[:id])
    @group = @manual.group
  end

  def update
    @manual = Manual.find(params[:id])
    @group = @manual.group
    if @manual.update(manual_params)
      redirect_to admin_manual_path(@manual.id, group_id: @group.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to edit_admin_manual_path(@manual.id, group_id: @group.id)
    end
  end

  private

  def manual_params
    params.require(:manual).permit(:group_id, :work_type_id, :name, :body, :is_active, files: [])
  end
end
