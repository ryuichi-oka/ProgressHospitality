class Admin::SchedulesController < ApplicationController

  def new
    @group_id = params[:group_id]
    @member_id = params[:id]
    @schedule = Schedule.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { schedule: @schedule })

  end

  def create
    @schedule = Schedule.new(schedule_params)
    @member = @schedule.member
    @group = @schedule.group
    # if @schedule.save
    #   respond_to do |format|
    #     format.html { redirect_to root_path }
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     format.js { render partial: "error" }
    #   end
    # end
    @schedule.save

    redirect_to admin_member_path(@member.id, group_id: @group.id)
  end

  def index
    @events = Schedule.all
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
