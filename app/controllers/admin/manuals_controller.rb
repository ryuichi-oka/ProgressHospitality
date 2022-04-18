class Admin::ManualsController < ApplicationController

  def new
    @manual = Manual.new
  end

  def create
    @manual = Manual.new(manual_params)
    @manual.save
    redirect_to admin_manuals_path
  end

  def index
    @manuals = Manual.all
  end

  def show
    @manual = Manual.find(params[:id])
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
    params.require(:manual).permit(:group_id, :work_type_id, :name, :body, :is_active)
  end
end
