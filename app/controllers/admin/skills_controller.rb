class Admin::SkillsController < ApplicationController

  def new
    @skill = Skill.new
    @group_id = params[:group_id]
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
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    redirect_to admin_skill_path(@skill)
  end

  private

  def skill_params
    params.require(:skill).permit(:work_type_id, :group_id, :name, :rank, :body, :terms, :is_active)
  end

  def skill_detail_prams
    params.require(:skill_detail).permit(:skill_id, :body)
  end

end
