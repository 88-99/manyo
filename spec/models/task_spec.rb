require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: nil, content: '失敗テスト', deadline: '20211010', status: 0)
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: nil, deadline: '20211010', status: 0)
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '失敗テスト', content: '失敗テスト', deadline: '20211010', status: 0)
        expect(task).to be_valid
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        task = FactoryBot.create(:task)
        second_task = FactoryBot.create(:second_task)

        expect(Task.search_title('Factoryで作ったデフォルトのタイトル１, task1')).to include(task)
        expect(Task.search_title('Factoryで作ったデフォルトのタイトル１, task1')).not_to include(second_task)
        expect(Task.search_title('Factoryで作ったデフォルトのタイトル２, task2').count).to eq 1
      end
    end
  end
end
