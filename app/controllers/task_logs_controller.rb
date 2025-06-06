class TaskLogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @child = Child.find(params[:child_id])
    @task_log = TaskLog.new
    @task_templates = TaskTemplate.all
  end

  def create
    @task_log = TaskLog.new(task_log_params)
    if @task_log.save
      @child = Child.find(@task_log.child_id)
      @child.total_points += @task_log.task_template.point
      @child.save
      redirect_to child_path(@child), notice: 'お手伝いを記録し、ごほうびポイント加算'
    else
      @child = Child.find(task_log_params[:child_id])
      @task_templates = TaskTemplate.all
      render :new
    end
  end

  def album
    @child = Child.find(params[:child_id])
    @image_logs = @child.task_logs.with_attached_image.select { |log| log.image.attached? }
  end

  def show
    @child = Child.find(params[:child_id])
    @task_log = TaskLog.find(params[:id])
  end

  def edit
    @child = Child.find(params[:child_id])
    @task_log = TaskLog.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @task_log = TaskLog.find(params[:id])
    @task_log.update(task_log_params)
    redirect_to album_child_task_logs_path(@child)
  end

  def destroy
    @child = Child.find(params[:child_id])
    @task_log = TaskLog.find(params[:id])
    @task_log.destroy
    redirect_to album_child_task_logs_path(@child)
  end

  private

  def task_log_params
    params.require(:task_log).permit(:child_id, :task_template_id, :image)
  end
end
