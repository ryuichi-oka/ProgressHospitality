class Admin::SkillDetailsController < ApplicationController

  def new
    @skill_datail = SkillDetail.new
  end

  def create
    @skill_detail = SkillDetail.new(skill_detail_params)
    @skill_detail.save
    @skill = @skill_detail.skill
    redirect_to admin_skill_path(@skill.id)
  end

  def update
  end

  def destroy
    @skill_detail = SkillDetail.find(params[:id])
    @skill_detail.destroy
    @skill = @skill_detail.skill
    redirect_to admin_skill_path(@skill.id)
  end

  private

  def skill_detail_params
    params.require(:skill_detail).permit(:skill_id, :body)
  end
end
