require 'rails_helper'

RSpec.feature 'フォロー機能' do

  background do
    # テストユーザーを作成
    @user = create :user
    @other_user = create :user
    # トップページを開く
    visit root_path
    # ログインに遷移
    click_link 'ログイン'
    # ログインフォームに名前とパスワードを入力
    fill_in 'user[name]',with:@user.name
    fill_in 'user[password]',with:@user.password
    # ログインボタンをクリックする
    click_on 'ログイン'
    # ログインに成功
  end

  scenario 'フォローとフォロー解除' do
    # ユーザー一覧をクリック
    click_link 'ユーザー一覧'
    # ユーザー一覧が表示されていることを確認する
    expect(page).to have_content 'ユーザー一覧'
    # フォローボタンをクリックする
    click_button 'フォローする'
    # フォローされていることを確認する
    expect(@user.followings.count).to eq 1
    # フォロー解除ボタンをクリック
    click_button 'フォロー解除'
    # フォローが解除されていることを確認する
    expect(@user.followings.count).to eq 0
  end
end