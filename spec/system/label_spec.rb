require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do

  before do
    user = FactoryBot.create(:user, :a)
    visit new_session_path
    fill_in :session_email, with: user.email
    fill_in :session_password, with: user.password
    click_button 'Log in'
    @task = FactoryBot.create(:task, user: user)
    @second_task = FactoryBot.create(:second_task, user: user)
    @third_task = FactoryBot.create(:third_task, user: user)
  end

  describe '新規作成機能' do
    context 'ラベルを新規作成した場合' do
      it '作成したラベルがラベル一覧画面に表示される' do
        visit new_label_path
        fill_in :label_name, with: 'label_8888'
        click_button '登録する'
        visit labels_path
        expect(page).to have_content 'label_8888'
      end
    end
  end

  describe 'タスクへの登録機能' do
    context 'タスクの新規作成時にラベルを登録した場合' do
      it 'タスクの詳細画面に登録したラベルが表示される' do
        visit new_task_path
        fill_in :task_title, with: 'abc5678'
        fill_in :task_content, with: 'def1234'
        fill_in :task_deadline, with: '2023, 12, 30, 12, 30'
        select '未着手', from: 'task_status'
        select '低', from: 'task_priority'
        page.all(".btn-danger")[1].click
        click_button '登録する'
        visit tasks_path
        page.all(".btn-primary")[3].click
        expect(page).to have_content 'label-5'
      end
    end
  end

  describe '検索機能' do
    context 'ラベル名で検索した場合' do
      it '検索したラベルが付けられているタスクが表示される' do
        visit tasks_path
        select 'label-8', from: 'label_id'
        click_on '検索 / ﾘｾｯﾄ'
        expect(page).to have_content 'label-8'
      end
    end
  end
end
