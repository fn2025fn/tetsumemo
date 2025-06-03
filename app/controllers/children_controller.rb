class ChildrenController < ApplicationController
  def new
    @child = Child.new
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

  def child_params
    params.require(:child).permit(:name, :icon)
  end
end
