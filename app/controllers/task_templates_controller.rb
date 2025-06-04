class TaskTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_template, only: [:show, :edit, :update, :destroy]
  def index
    @task_templates = TaskTemplate.all
  end

  def new
    @task_template = TaskTemplate.new
  end

  def create
    @task_template = TaskTemplate.new(task_template_params)
    if @task_template.save
      redirect_to task_templates_path, notice: 'テンプレートを登録しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task_template.update(task_template_params)
      redirect_to task_templates_path, notice: 'テンプレートを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @task_template.destroy
    redirect_to task_templates_path, notice: 'テンプレートを削除しました'
  end

  private

  def set_task_template
    @task_template = TaskTemplate.find(params[:id])
  end

  def task_template_params
    params.require(:task_template).permit(:title, :point)
  end
end
