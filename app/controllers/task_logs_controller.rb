class TaskLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child
  before_action :set_task_log, only: [:show, :edit, :update, :destroy]

  def new
    @task_log = TaskLog.new
    @task_templates = TaskTemplate.all
  end

  def create
    @task_log = TaskLog.new(task_log_params)
    @task_log.from = params[:task_log][:from]
    @child = Child.find(@task_log.child_id)

    if @task_log.save
      if @task_log.from == 'memory'
        redirect_to album_child_task_logs_path(@child), notice: '思い出を登録しました'
      else
        redirect_to child_path(@child), notice: 'お手伝いを記録し、ごほうびポイント加算'
      end
    else
      @task_templates = TaskTemplate.all
      render @task_log.from == 'memory' ? :new_memory : :new
    end
  end

  def album
    @image_logs = @child.task_logs.with_attached_image.select { |log| log.image.attached? }
  end

  def show
  end

  def edit
  end

  def update
    @task_log.update(task_log_params)
    redirect_to album_child_task_logs_path(@child)
  end

  def destroy
    @task_log.destroy
    redirect_to child_path(@child), notice: 'お手伝い記録を削除しました'
  end

  def new_memory
    @task_log = TaskLog.new
    @task_templates = TaskTemplate.all
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_task_log
    @task_log = TaskLog.find(params[:id])
  end

  def task_log_params
    params.require(:task_log).permit(:child_id, :task_template_id, :image, :title,
                                     :from)
  end
end
