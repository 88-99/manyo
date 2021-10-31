FactoryBot.define do
  factory :task do
    title {'Factoryで作ったデフォルトのタイトル１'}
    content {'Factoryで作ったデフォルトのコンテント１'}
    deadline {'20251010'}
    status { 0 }
    priority { 2 }
  end

  factory :second_task, class: Task do
    title {'Factoryで作ったデフォルトのタイトル２'}
    content {'Factoryで作ったデフォルトのコンテント２'}
    deadline {'20211010'}
    status { 1 }
    priority { 1 }
  end

  factory :third_task, class: Task do
    title {'Factoryで作ったデフォルトのタイトル3'}
    content {'Factoryで作ったデフォルトのコンテント3'}
    deadline {'20231010'}
    status { 2 }
    priority { 0 }
  end
end
