class TaskTemplatesController < ApplicationController
  def index
    @task_templates = TaskTemplate.all
  end

  def new
    @task_templates = TaskTemplate.all
  end

  def create
    @task_template = TaskTemplate.new(task_template_params)
    if @task_template.save
      redirect_to task_templates_path, notice: 'テンプレートを登録しました'
    else
      render :new
    end
  end

  def task_template_params
    params.require(:task_template).permit(:title, :point)
  end
end
