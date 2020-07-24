require 'rails_helper'

RSpec.feature 'ログインテスト' do

  # before do
  #   # ユーザを作成する
  #   @user = create :user
  # end
  
    scenario '正常にログインされる' do
      @user = create :user
      # トップページを開く
      visit root_path
      # ログインに遷移
      click_link 'ログイン'
      # ログインフォームに名前とパスワードを入力
      fill_in 'user[name]',with:@user.name
      fill_in 'user[password]',with:'foobar'  
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功することを検証する
        expect(page).to have_content 'ログインしました。'
    end

    scenario '名前が空白ならばログインに失敗する' do
      @user = create :user
      # トップページを開く
      visit root_path
      # ログインに遷移
      click_link 'ログイン'
      # ログインフォームに名前とパスワードを入力
      fill_in 'user[name]',with:''
      fill_in 'user[password]',with:@user.password
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功することを検証する
      expect(page).to have_content '名前またはパスワードが違います。'
    end

    scenario '名前を間違えるとログインに失敗する' do
      @user = create :user
      # トップページを開く
      visit root_path
      # ログインに遷移
      click_link 'ログイン'
      # ログインフォームに名前とパスワードを入力
      fill_in 'user[name]',with:'TestMame3'
      fill_in 'user[password]',with:@user.password
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功することを検証する
      expect(page).to have_content '名前またはパスワードが違います。'
    end

    scenario 'パスワードが空白ならばログインに失敗する' do
      @user = create :user
      # トップページを開く
      visit root_path
      # ログインに遷移
      click_link 'ログイン'
      # ログインフォームに名前とパスワードを入力
      fill_in 'user[name]',with:@user.name
      fill_in 'user[password]',with:''
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功することを検証する
      expect(page).to have_content '名前またはパスワードが違います。'
    end

    scenario 'パスワードが違ければログインに失敗する' do
      @user = create :user
      # トップページを開く
      visit root_path
      # ログインに遷移
      click_link 'ログイン'
      # ログインフォームに名前とパスワードを入力
      fill_in 'user[name]',with:@user.name
      fill_in 'user[password]',with:'foobal'
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功することを検証する
      expect(page).to have_content '名前またはパスワードが違います。'
    end
end