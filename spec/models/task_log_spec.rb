require 'rails_helper'

RSpec.describe TaskLog, type: :model do
  before do
    @child = FactoryBot.create(:child)
    @task_template = FactoryBot.create(:task_template)
    @task_log = FactoryBot.build(:task_log, child: @child, task_template: @task_template)
  end

  context 'お手伝い記録を保存できるとき' do
    it 'child_idとtask_template_idが存在すれば保存できる' do
      expect(@task_log).to be_valid
    end
  end

  context 'お手伝い記録を保存できないとき' do
    it 'child_idが空だと保存できない' do
      @task_log.child = nil
      @task_log.valid?
      expect(@task_log.errors.full_messages).to include('Child must exist')
    end

    it 'task_template_idが空だと保存できない' do
      @task_log.task_template = nil
      @task_log.valid?
      expect(@task_log.errors.full_messages).to include('Task template must exist')
    end
  end
end
