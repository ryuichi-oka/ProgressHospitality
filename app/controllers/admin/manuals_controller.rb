class Admin::ManualsController < ApplicationController

  def new
    @manual = Manual.new
    @group_id = params[:group_id]
  end

  def create
    @manual = Manual.new(manual_params)
    @manual.save
    @group = @manual.group
    redirect_to admin_manuals_path(group_id: @group.id)
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
  end

  def update
    @manual = Manual.find(params[:id])
    @manual.update(manual_params)
    redirect_to admin_manual_path(@manual)
  end

  private

  def manual_params
    params.require(:manual).permit(:group_id, :work_type_id, :name, :body, :is_active, files: [])
  end
end