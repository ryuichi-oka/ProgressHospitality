class Admin::SkillDetailsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @skill_datail = SkillDetail.new
  end

  def create
    @skill_detail = SkillDetail.new(skill_detail_params)
    @skill = @skill_detail.skill
    @group = @skill.group
    if @skill_detail.save
      redirect_to admin_skill_path(@skill.id, group_id: @group.id)
    else
      flash[:error] = "技術内容を入力してください。"
      redirect_to admin_skill_path(@skill.id, group_id: @group.id)
    end
  end

  def update
  end

  def destroy
    @skill_detail = SkillDetail.find(params[:id])
    @skill_detail.destroy
    @skill = @skill_detail.skill
    @group = @skill.group
    redirect_to admin_skill_path(@skill.id, group_id: @group.id)
  end

  private

  def skill_detail_params
    params.require(:skill_detail).permit(:skill_id, :body)
  end
end
