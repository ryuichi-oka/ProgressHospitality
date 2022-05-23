class Member::SchedulesController < ApplicationController
  before_action :authenticate_member!

  def new
    @member_id = params[:id]
    @group_id = params[:group_id]
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

    redirect_to member_member_path(@member.id)
  end

  def index
    @events = Schedule.where(member_id: current_member.id)
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
