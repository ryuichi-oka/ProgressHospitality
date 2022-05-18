class Member::CommentsController < ApplicationController
  before_action :authenticate_member!


  def create
    group_message = GroupMessage.find(params[:group_message_id])
    comment = Comment.new(comment_params)
    comment.group_message_id = group_message.id
    comment.member_id = current_member.id
    if comment.save
      redirect_to member_group_message_path(group_message.id)
    else
      flash[:error] = "本文を入力してください。"
      redirect_to member_group_message_path(group_message.id)
    end
  end

  def destroy
    group_message = GroupMessage.find(params[:group_message_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to member_group_message_path(group_message.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
