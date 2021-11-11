require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが表示される' do
        visit new_user_path
        fill_in :user_name, with: 'test1234'
        fill_in :user_email, with: 'test@test.com'
        fill_in :user_password, with: 'test'
        fill_in :user_password_confirmation, with: 'test'
        click_button 'アカウントを作成する'
        visit tasks_path
        expect(page).to have_content 'test1234'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面が表示される' do
        user = FactoryBot.create(:user)
        delete logout_path
        visit tasks_path
        byebug

        expect(page).to have_content 'test1234'
      end
    end
  end
  # describe '詳細表示機能' do
  #    context '任意のタスク詳細画面に遷移した場合' do
  #      it '該当タスクの内容が表示される' do
  #      end
  #    end
  # end
end
