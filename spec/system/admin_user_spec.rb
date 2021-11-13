require 'rails_helper'
RSpec.describe '管理機能', type: :system do

  # before do
  #   admin_user = FactoryBot.create(:user, :admin)
  #   @user = FactoryBot.create(:user, :a)
  #   @user_2 = FactoryBot.create(:user, :b)
  #   visit new_session_path
  #   fill_in :session_email, with: admin_user.email
  #   fill_in :session_password, with: admin_user.password
  #   click_button 'Log in'
  # end
  #
  # describe 'アクセス機能' do
  #   context '管理ユーザが管理画面にアクセスした場合' do
  #     it 'ユーザ一覧が表示される' do
  #       visit admin_users_path
  #       expect(page).to have_content "【管理者用】ユーザ一覧"
  #     end
  #   end
  #
  #   context '一般ユーザが管理画面にアクセスした場合' do
  #     it '権限がありません。と表示され、管理画面に遷移しない' do
  #       visit new_session_path
  #       fill_in :session_email, with: @user.email
  #       fill_in :session_password, with: @user.password
  #       click_button 'Log in'
  #       visit admin_users_path
  #       expect(page).to have_content "権限がありません。"
  #       expect(page).not_to have_content "【管理者用】ユーザ一覧"
  #     end
  #   end
  #
  #   context '管理ユーザがユーザの詳細画面にアクセスした場合' do
  #     it '該当ユーザの詳細画面が表示される' do
  #       visit admin_users_path(1)
  #       expect(page).to have_content "【管理者用】factory_user_aaa のページ" && "Profile Logout factory_user_admin"
  #     end
  #   end
  # end
  #
  # describe 'ユーザの新規登録機能' do
  #   context '管理ユーザがユーザを新規登録した場合' do
  #     it '該当ユーザが作成される' do
  #       visit admin_users_path
  #       click_on "ユーザ作成画面へ"
  #       fill_in :user_name, with: 'test_abcd'
  #       fill_in :user_email, with: 'test@abcd.com'
  #       fill_in :user_password, with: 'abcd'
  #       fill_in :user_password_confirmation, with: 'abcd'
  #       click_button 'アカウントを作成する'
  #       visit tasks_path
  #       expect(page).to have_content 'test_abcd'
  #     end
  #   end
  # end
  #
  # describe 'ユーザの編集機能' do
  #   context '管理ユーザがユーザの編集画面を更新した場合' do
  #     it '該当ユーザの編集した内容のみが更新される' do
  #       visit admin_users_path
  #       page.all(".btn-success")[2].click
  #       fill_in :user_name, with: 'factory_user_admin_change!'
  #       fill_in :user_password, with: 'abcd'
  #       fill_in :user_password_confirmation, with: 'abcd'
  #       click_button "アカウントを作成する"
  #       expect(page).to have_content 'ユーザ「factory_user_admin_change!」を更新しました！'
  #     end
  #   end
  # end
  #
  # describe 'ユーザの削除機能' do
  #   context '管理ユーザがユーザを削除した場合' do
  #     it '該当ユーザが削除される' do
  #       page.all(".btn-danger")[2].click
  #       expect(page).to have_content 'ユーザ「factory_user_bbb」を削除しました！'
  #     end
  #   end
  # end
end
