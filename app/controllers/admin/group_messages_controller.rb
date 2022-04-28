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
    @group = @group_message.group
    @files = params[:files]
  end

  def edit
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
  end

  def update
    @group_message = GroupMessage.find(params[:id])
    @group_message.update(group_message_params)
    redirect_to admin_group_message_path(@group_message.id)
  end

  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group_message.destroy
    @group = @group_message.group
    redirect_to admin_group_messages_path(group_id: @group.id)
  end

  private

  def group_message_params
    params.require(:group_message).permit(:group_id, :title, :body, files: [])
  end
end
