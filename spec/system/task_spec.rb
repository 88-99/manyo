require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  before do
    @task = FactoryBot.create(:task)
    @second_task = FactoryBot.create(:second_task)
    @third_task = FactoryBot.create(:third_task)
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in :task_title, with: 'abc, task'
        fill_in :task_content, with: 'def, task'
        fill_in :task_deadline, with: '00202110101111'
        click_button '登録する'
        expect(page).to have_content 'abc, task'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task = first('tbody tr')
        expect(task).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限の遠いタスクが一番上に表示される' do
        visit tasks_path(sort_expired: "true")
        task = first('tbody tr')
        expect(task).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
    context 'タスクが優先順位の高い順に並んでいる場合' do
      it '優先順位の高いタスクが一番上に表示される' do
        visit tasks_path(sort_priority: "true")
        task = first('tbody tr')
        expect(task).to have_content 'Factoryで作ったデフォルトのコンテント１'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         visit task_path(@task.id)
         expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
       end
     end
  end
end
