class Admin::MemberSkillsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @member_skill = MemberSkill.new
  end

  def create
    @member_skill = MemberSkill.new(member_skill_params)
    @member_skill.save
    @member = @member_skill.member
    @group = @member.group
    redirect_to admin_member_path(@member.id, group_id: @group.id)
  end

  def update
    @member_skill = MemberSkill.find(params[:id])
    @group = @member_skill.member.group
    @member_skill.update(member_skill_params)
    @member = @member_skill.member
    @group = @member.group
    if @member_skill.level == 100
      @member_skill.update(is_acquire: true)
    end
    redirect_to admin_member_path(@member.id, group_id: @group.id)
  end

  def destroy
    @member_skill = MemberSkill.find(params[:id])
    @member_skill.destroy
    @member = @member_skill.member
    @group = @member.group
    redirect_to admin_member_path(@member.id, group_id: @group.id)
  end

  private

  def member_skill_params
    params.require(:member_skill).permit(:member_id, :skill_id, :is_acquire, :level)
  end
end
