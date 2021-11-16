require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do

  before do
    @user = FactoryBot.create(:user, :a)
    @user_2 = FactoryBot.create(:user, :b)
    visit new_session_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_button 'Log in'
  end

  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが表示される' do
        click_on "Logout"
        visit new_user_path
        fill_in :user_name, with: 'test1234'
        fill_in :user_email, with: 'test@test.com'
        fill_in :user_password, with: 'test'
        fill_in :user_password_confirmation, with: 'test'
        click_button 'アカウントを作成する'
        expect(page).to have_content 'test1234'
      end
    end

    context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面が表示される' do
        click_on "Logout"
        visit tasks_path
        expect(page).to have_content 'Sign up Login'
      end
    end
  end

  describe 'セッション機能' do
    context 'ログインした場合' do
      it 'ログインしたユーザーが表示される' do
        click_on "Logout"
        visit new_session_path
        fill_in :session_email, with: @user.email
        fill_in :session_password, with: @user.password
        click_button 'Log in'
        expect(page).to have_content 'factory_user_aaa'
      end
    end

    context 'ユーザーの詳細画面に遷移した場合' do
      it '詳細画面が表示される' do
        visit user_path(@user.id)
        expect(page).to have_content 'factory_user_aaaのページ'
      end
    end

    context '一般ユーザーが他ユーザーの詳細画面に遷移した場合' do
      it '自分の一覧画面が表示される' do
        visit tasks_path(@user_2.id)
        expect(page).to have_content 'factory_user_aaa' && 'タスク一覧'
      end
    end

    context 'ログアウトした場合' do
      it 'ログアウトしました。が表示される' do
        visit tasks_path
        click_on "Logout"
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end
