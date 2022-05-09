class Member::GroupMessagesController < ApplicationController

  def index
    @group = current_member.group
    @group_messages = GroupMessage.where(group_id: @group.id)
  end

  def show
    @group = current_member.group
    @group_message = GroupMessage.find(params[:id])
    @files = params[:files]
    @comments = @group_message.comments.all
    @comment = Comment.new
  end
end
