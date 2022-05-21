class Admin::ShiftsController < ApplicationController

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @member = params[:member_id]
    @group_id = params[:group_id]
    @shift.save
    redirect_to admin_member_path(@member, group_id: @group_id)
  end

  def update
  end

  def destroy
  end

  private

  def shift_params
    params.require(:shift).permit(:member_id, :shift, :shift_end, :holiday, :month)
  end

end
