class Member::SkillsController < ApplicationController

  def index
    @group = current_member.group
    @skills = Skill.where(group_id: @group.id)
  end

  def show
    @group = current_member.group
    @skill = Skill.find(params[:id])
    @skill_details = @skill.skill_details
    @skill_manuals = @skill.skill_manuals
  end
end
