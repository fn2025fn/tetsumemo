class TaskLog < ApplicationRecord
  belongs_to :child
  belongs_to :task_template
  has_one_attached :image
end
