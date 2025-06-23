class TaskLog < ApplicationRecord
  belongs_to :child
  belongs_to :task_template, optional: true
  has_one_attached :image

  attr_accessor :from

  validates :child_id, presence: true
  validates :task_template_id, presence: true, unless: :memory_log?

  after_create :add_point_to_child, unless: :memory_log?

  def memory_log?
    title.present? && image.attached? && task_template_id.blank?
  end

  private

  def add_point_to_child
    child.increment!(:total_points, task_template.point)
  end
end
