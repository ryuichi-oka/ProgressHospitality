class Admin::WorkTypesController < ApplicationController

  def new
  end

  def create
    @work_type = WorkType.new(work_type_params)
    @work_type.save
    redirect_to admin_work_types_path
  end

  def index
    @work_type_new = WorkType.new
    @work_types = WorkType.all
  end

  def edit
  end

  def update
    @work_type = WorkType.find(params[:id])
    @work_type.update(work_type_params)
    redirect_to admin_work_types_path
  end

  private

  def work_type_params
    params.require(:work_type).permit(:work_type, :is_active)
  end

end
