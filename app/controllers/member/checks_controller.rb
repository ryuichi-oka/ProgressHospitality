class Member::ChecksController < ApplicationController
  before_action :authenticate_member!

  def create
    group_message = GroupMessage.find(params[:group_message_id])
    check = current_member.checks.new(group_message_id: group_message.id)
    check.save
    redirect_to member_group_message_path(group_message.id)
  end

  def destroy
    group_message = GroupMessage.find(params[:group_message_id])
    check = current_member.checks.find_by(group_message_id: group_message.id)
    check.destroy
    redirect_to member_group_message_path(group_message.id)
  end
end
