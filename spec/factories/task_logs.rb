FactoryBot.define do
  factory :task_log do
    association :child
    association :task_template
  end
end
