class Member::MemberSkillsController < ApplicationController
  def new
    @member_skill = MemberSkill.new
  end

  def create
    @member_skill = MemberSkill.new(member_skill_params)
    @member_skill.save
    @member = current_member
    redirect_to member_member_path(@member.id)
  end



  def destroy
    @member_skill = MemberSkill.find(params[:id])
    @member_skill.destroy
    @member = current_member
    redirect_to member_member_path(@member.id)
  end

  private

  def member_skill_params
    params.require(:member_skill).permit(:member_id, :skill_id, :is_acquire, :level)
  end
end
