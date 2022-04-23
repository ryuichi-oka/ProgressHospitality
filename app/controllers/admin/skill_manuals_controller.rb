class Admin::SkillManualsController < ApplicationController

  def new
    @skill_manual = SkillManual.new
  end

  def create
    @skill_manual = SkillManual.new(skill_manual_params)
    @skill_manual.save
    @skill = @skill_manual.skill
    redirect_to admin_skill_path(@skill.id)
  end

  def destroy
    @skill_manual = SkillManual.find(params[:id])
    @skill_manual.destroy
    @skill = @skill_manual.skill
    redirect_to admin_skill_path(@skill.id)
  end

  private

  def skill_manual_params
    params.require(:skill_manual).permit(:skill_id, :manual_id)
  end
end
