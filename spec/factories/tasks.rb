FactoryBot.define do
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル１, task' }
    content { 'Factoryで作ったデフォルトのコンテント１, task' }
  end

  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２, task ' }
    content { 'Factoryで作ったデフォルトのコンテント２, task' }
  end
end
