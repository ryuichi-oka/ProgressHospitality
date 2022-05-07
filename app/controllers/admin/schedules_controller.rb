class Admin::SchedulesController < ApplicationController

  def new
    # @schedule = Schedule.new
    @shift = Shift.new
    @member = Member.find(params[:member_id])

    @month = params[:month]

    if @month.to_i < Date.today.month
      @day = Date.today.months_ago(Date.today.month - @month.to_i)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    elsif @month.to_i > Date.today.month
      @day = Date.today.months_since(@month.to_i - Date.today.month)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    else
      @day = Date.today
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    end

  end

  def create
    # @schedule = Schedule.new(schedule_params)
    # @schedule.save
    # @group_id = params[:group_id]
    # redirect_to admin_schedules_path(group_id: @group_id, month: params[:month])
    @member = Member.find(params[:member_id])
    @month = params[:month]
    @group = @member.group
    params[:shift].each do |k, v|
      # p "#{k} / #{v[:hour]} / #{v[:min]}"
      # p Time.zone.parse("#{k} 00:00:00").beginning_of_month
      # p v[:holiday]
      unless v[:holiday]
        Shift.create(
            member_id: params[:member_id],
            shift: "#{k} #{v[:shift]}:00",
            shift_end: "#{k} #{v[:shift_end]}:00",
            holiday: false,
            comment: v[:comment],
            month: Time.zone.parse("#{k} 00:00:00")
          )
      else
        Shift.create(
            member_id: params[:member_id],
            # shift: Time.zone.parse("#{k} #{v[:hour]}:#{v[:min]}:00"),
            holiday: true,
            comment: v[:comment],
            month: Time.zone.parse("#{k} 00:00:00")
          )
      end
    end
    redirect_to admin_schedules_path(group_id: @group.id, month: @month)
  end

  def index
    # @schedule = Schedule.new
    # @schedules = Schedule.all
    @month = params[:month]
    @group_id = params[:group_id]

    if @month.to_i < Date.today.month
      @day = Date.today.months_ago(Date.today.month - @month.to_i)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    elsif @month.to_i > Date.today.month
      @day = Date.today.months_since(@month.to_i - Date.today.month)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    else
      @day = Date.today
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    end


    @members = Member.where(group_id: @group_id)
  end

  def shift_edit
    @member = Member.find(params[:member_id])
    @month = params[:month]

    if @month.to_i < Date.today.month
      @day = Date.today.months_ago(Date.today.month - @month.to_i)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    elsif @month.to_i > Date.today.month
      @day = Date.today.months_since(@month.to_i - Date.today.month)
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    else
      @day = Date.today
      @from_date = Date.new(@day.year, @day.month, @day.beginning_of_month.day)
      @to_date = Date.new(@day.year, @day.month, @day.end_of_month.day)
      @schedule_data = @from_date.upto(@to_date)
    end

    @shifts = Shift.where(month: @from_date..@to_date, member_id: @member.id)
  end

  def shift_update
    @member = Member.find(params[:member_id])
    @month = params[:month]
    @group = @member.group
    params[:shift].each do |k, v|
      # p "#{k} / #{v[:hour]} / #{v[:min]}"
      # p Time.zone.parse("#{k} 00:00:00").beginning_of_month
      # p v[:holiday]
      unless v[:holiday]
        Shift.update(
            member_id: params[:member_id],
            shift: "#{k} #{v[:shift]}:00",
            shift_end: "#{k} #{v[:shift_end]}:00",
            holiday: false,
            comment: v[:comment],
            month: Time.zone.parse("#{k} 00:00:00")
          )
      else
        Shift.update(
            member_id: params[:member_id],
            # shift: Time.zone.parse("#{k} #{v[:hour]}:#{v[:min]}:00"),
            holiday: true,
            comment: v[:comment],
            month: Time.zone.parse("#{k} 00:00:00")
          )
      end
    end
    redirect_to admin_schedules_path(group_id: @group.id, month: @month)
  end

  private

  def schedule_params
    params.require(:shift).permit(:group_id, :date, :event)
  end

end
