class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def new
    @child = Child.new
  end

  def show
    start_time = if params[:period] == 'week'
                   Time.zone.now.beginning_of_week
                 elsif params[:period] == 'month'
                   Time.zone.now.beginning_of_month
                 else
                   Time.zone.now.beginning_of_day
                 end
    @filtered_logs = @child.task_logs.where('created_at >= ?', start_time)
    @total_points = 0
    @filtered_logs.each do |log|
      @total_points += log.task_template.point if log.task_template.present?
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to @child, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, notice: '削除しました'
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user
    if @child.save
      redirect_to children_path, notice: '子どもを登録しました'
    else
      render :new
    end
  end

  def index
    @children = current_user.children
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :icon)
  end
end
