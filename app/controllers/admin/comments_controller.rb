class Admin::CommentsController < ApplicationController

  def destroy
    group_message = GroupMessage.find(params[:group_message_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_group_message_path(group_message.id)
  end
end
