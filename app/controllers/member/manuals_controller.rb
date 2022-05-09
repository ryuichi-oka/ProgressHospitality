class Member::ManualsController < ApplicationController

  def index
    @group = current_member.group
    @manuals = Manual.where(group_id: @group.id)
  end

  def show
    @group = current_member.group
    @manual = Manual.find(params[:id])
  end
end
