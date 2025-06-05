class TaskLog < ApplicationRecord
  belongs_to :child
  belongs_to :task_template
  has_one_attached :image

  validates :child_id, presence: true
  validates :task_template_id, presence: true
end
