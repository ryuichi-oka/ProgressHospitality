class Admin::GroupMessagesController < ApplicationController

  def new
    @group_message = GroupMessage.new
    @group_id = params[:group_id]
  end

  def create
    @group_message = GroupMessage.new(group_message_params)
    @group_message.save
    @group = @group_message.group
    redirect_to admin_group_messages_path(group_id: @group.id)
  end

  def index
    @group = Group.find(params[:group_id])
    @group_messages = @group.group_messages.where(group_id: @group.id)
  end

  def show
    @group_message = GroupMessage.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_message_params
    params.require(:group_message).permit(:group_id, :title, :body)
  end
end
