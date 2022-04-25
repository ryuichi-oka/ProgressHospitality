class Admin::MembersController < ApplicationController


  def show
    @member = Member.find(params[:id])
    @member_skills = MemberSkill.where(member_id: @member.id)
    @acquired = @member_skills.where(is_acquire: true)
    @challenges = @member_skills.where(is_acquire: false)
    @member_skill = MemberSkill.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member.id)
  end

  private

  def member_params
    params.require(:member).permit(:group_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :objective, :birthday, :image)
  end
end
