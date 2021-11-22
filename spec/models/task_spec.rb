require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  # describe 'バリデーションのテスト' do
  #   before do
  #     @user = FactoryBot.create(:user, :a)
  #   end
  #   context 'タスクのタイトルが空の場合' do
  #     it 'バリデーションにひっかる' do
  #       task = Task.new(title: nil, content: '失敗テスト', deadline: '20211010', status: 0, priority: 1, user_id: @user.id)
  #       expect(task).not_to be_valid
  #     end
  #   end
  #   context 'タスクの詳細が空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       task = Task.new(title: '失敗テスト', content: nil, deadline: '20211010', status: 0, priority: 0, user_id: @user.id)
  #       expect(task).not_to be_valid
  #     end
  #   end
  #   context 'タスクのタイトルと詳細に内容が記載されている場合' do
  #     it 'バリデーションが通る' do
  #       task = Task.new(title: '成功テスト', content: '成功テスト', deadline: '20211010', status: 0, priority: 2, user_id: @user.id)
  #       expect(task).to be_valid
  #     end
  #   end
  #   context 'scopeメソッドでタイトルのあいまい検索をした場合' do
  #     it "検索キーワードを含むタスクが絞り込まれる" do
  #       task = FactoryBot.create(:task, user: @user)
  #       second_task = FactoryBot.create(:second_task, user: @user)
  #       expect(Task.search_title('Factoryで作ったデフォルトのタイトル１')).to include(task)
  #       expect(Task.search_title('Factoryで作ったデフォルトのタイトル１')).not_to include(second_task)
  #       expect(Task.search_title('Factoryで作ったデフォルトのタイトル２').count).to eq 1
  #     end
  #   end
  # end
end
