class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @task_templates = TaskTemplate.limit(6)
    @children = current_user.children.limit(3)
  end

  def register
    task_template_id = params[:task_template_id]
    child_id = params[:child_id]

    @task_log = TaskLog.new(task_template_id: task_template_id, child_id: child_id)

    if @task_log.save

      child = Child.find(child_id)
      child.total_points += @task_log.task_template.point
      child.save
      redirect_to child_path(child), notice: 'お手伝いを記録しました'
    else
      redirect_to root_path, alert: '登録に失敗しました'
    end
  end
end
