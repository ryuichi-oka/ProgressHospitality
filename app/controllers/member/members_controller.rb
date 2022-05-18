class Member::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
    @group = @member.group
    @member_skills = MemberSkill.where(member_id: @member.id)
    @acquired = @member_skills.where(is_acquire: true)
    @challenges = @member_skills.where(is_acquire: false)
    @member_skill = MemberSkill.new
  end

  def index
  end

  def edit
    @member = current_member
    @group = @member.group
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_member_path(current_member.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to edit_member_member_path(current_member.id)
    end
  end

  private

  def member_params
    params.require(:member).permit(:group_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :objective, :birthday, :image)
  end
end
