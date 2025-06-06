class TaskTemplate < ApplicationRecord
  has_many :task_logs, dependent: :destroy

  validates :title, presence: true
  validates :point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
