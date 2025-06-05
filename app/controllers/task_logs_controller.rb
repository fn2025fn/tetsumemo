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
      redirect_to child_path(@task_log.child), notice: 'お手伝いを記録しました'
    else
      render :new
    end
  end

  private

  def task_log_params
    params.require(:task_log).permit(:child_id, :task_template_id, :image)
  end
end
