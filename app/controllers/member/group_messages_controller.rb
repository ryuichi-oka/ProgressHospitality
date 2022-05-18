class Member::GroupMessagesController < ApplicationController
  before_action :authenticate_member!

  def index
    @group = current_member.group
    @group_messages = GroupMessage.where(group_id: @group.id)
  end

  def show
    @group = current_member.group
    @group_message = GroupMessage.find(params[:id])
    @files = params[:files]
    @members = @group.members.where(is_active: true)
    @comments = @group_message.comments.all
    @comment = Comment.new
  end
end
