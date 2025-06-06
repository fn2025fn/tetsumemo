class Child < ApplicationRecord
  belongs_to :user
  has_many :task_logs, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
end
