class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def create
    @member_new = Member.new(member_params)
    @member_new.save
    @group = @member_new.group
    redirect_to admin_group_path(group_id: @group.id)
  end

  def show
    @member = Member.find(params[:id])
    @group = @member.group
    @member_skills = MemberSkill.where(member_id: @member.id)
    @acquired = @member_skills.where(is_acquire: true)
    @challenges = @member_skills.where(is_acquire: false)
    @member_skill = MemberSkill.new

    @day = Date.today
    @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
    @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
    @schedule_data = @from_date.upto(@to_date)

    @schedule = Schedule.new
    @events = Schedule.all

  end

  def edit
    @member = Member.find(params[:id])
    @group = @member.group
  end

  def update
    @member = Member.find(params[:id])
    @group = @member.group
    if @member.update(member_params)
      redirect_to admin_member_path(@member.id, group_id: @group.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to edit_admin_member_path(@member.id, group_id: @group.id)
    end
  end

  private

  def member_params
    params.require(:member).permit(:group_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :objective, :birthday)
  end
end
