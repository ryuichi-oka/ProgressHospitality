class Admin::SkillsController < ApplicationController

  def new
    @skill = Skill.new
    @group = Group.find(params[:group_id])
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.save
    @group = @skill.group
    redirect_to admin_skills_path(group_id: @group.id)
  end

  def index
    @group = Group.find(params[:group_id])
    @skills = @group.skills.where(group_id: @group.id)
  end

  def show
    @skill = Skill.find(params[:id])
    @group = @skill.group
    @skill_details = SkillDetail.where(skill_id: @skill.id)
    @skill_detail = SkillDetail.new
    @skill_manuals = SkillManual.where(skill_id: @skill.id)
    @skill_manual = SkillManual.new
  end

  def edit
    @skill = Skill.find(params[:id])
    @group = @skill.group
  end

  def update
    @skill = Skill.find(params[:id])
    @group = @skill.group
    @skill.update(skill_params)
    redirect_to admin_skill_path(@skill.id, group_id: @group.id)
  end

  private

  def skill_params
    params.require(:skill).permit(:work_type_id, :group_id, :name, :rank, :body, :terms, :is_active)
  end



end
