class Admin::SchedulesController < ApplicationController

  def new

  end

  def create

  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def schedule_params
    params.require(:schedule).permit(:group_id, :member_id, :date, :event)
  end



end
