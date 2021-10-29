FactoryBot.define do
  factory :task do
    title {'Factoryで作ったデフォルトのタイトル１, task1'}
    content {'Factoryで作ったデフォルトのコンテント１, task1'}
    deadline {'20251010'}
  end

  factory :second_task, class: Task do
    title {'Factoryで作ったデフォルトのタイトル２, task2'}
    content {'Factoryで作ったデフォルトのコンテント２, task2'}
    deadline {'20211010'}
  end

  factory :third_task, class: Task do
    title {'Factoryで作ったデフォルトのタイトル3, task3'}
    content {'Factoryで作ったデフォルトのコンテント3, task3'}
    deadline {'20231010'}
  end
end
