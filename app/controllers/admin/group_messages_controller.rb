class Admin::GroupMessagesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @group_message = GroupMessage.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group_message = GroupMessage.new(group_message_params)
    @group = @group_message.group
    if @group_message.save
      redirect_to admin_group_messages_path(group_id: @group.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to new_admin_group_message_path(group_id: @group.id)
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @group_messages = @group.group_messages.where(group_id: @group.id)
  end

  def show
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
    @members = @group.members.where(is_active: true)
    @files = params[:files]
    @comments = @group_message.comments.all
  end

  def edit
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
  end

  def update
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
    if @group_message.update(group_message_params)
      redirect_to admin_group_message_path(@group_message.id, group_id: @group.id)
    else
      flash[:error] = " * は必須です。"
      redirect_to edit_admin_group_message_path(@group_message.id, group_id: @group.id)
    end
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
