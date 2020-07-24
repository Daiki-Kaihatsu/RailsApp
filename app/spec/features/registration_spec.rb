require 'rails_helper'

RSpec.feature '新規登録テスト' do
  
  scenario '正常に新規登録される' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:'細井大輝'
    fill_in 'user[email]',with:'test@example.com'
    fill_in 'user[password]',with:'foobar'
    fill_in 'user[password_confirmation]',with:'foobar'
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録に成功することを検証する
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  scenario '名前が空白ならば新規登録に失敗する' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 新規登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:''
    fill_in 'user[email]',with:'test@example.com'
    fill_in 'user[password]',with:'foobar'
    fill_in 'user[password_confirmation]',with:'foobar'
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録が失敗することを検証する
    expect(page).to have_content '名前を入力してください'
  end

  scenario 'メールアドレスが空白ならば新規登録に失敗する' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 新規登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:'細井大輝'
    fill_in 'user[email]',with:''
    fill_in 'user[password]',with:'foobar'
    fill_in 'user[password_confirmation]',with:'foobar'
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録が失敗することを検証する
    expect(page).to have_content 'Eメールを入力してください'
  end

  scenario 'パスワードが空白ならば新規登録に失敗する' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 新規登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:'細井大輝'
    fill_in 'user[email]',with:'test@example.com'
    fill_in 'user[password]',with:''
    fill_in 'user[password_confirmation]',with:'foobar'
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録が失敗することを検証する
    expect(page).to have_content 'パスワードを入力してください'
  end

  scenario 'パスワード確認が空白ならば新規登録に失敗する' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 新規登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:'細井大輝'
    fill_in 'user[email]',with:'test@example.com'
    fill_in 'user[password]',with:'foobar'
    fill_in 'user[password_confirmation]',with:''
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録が失敗することを検証する
    expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
  end

  scenario 'パスワードとパスワード確認が異なれば新規登録に失敗する' do
    # トップページを開く
    visit root_path
    # 新規登録画面に遷移
    click_link 'アカウント登録'
    # 新規登録フォームに名前とパスワードを入力
    fill_in 'user[name]',with:'細井大輝'
    fill_in 'user[email]',with:'test@example.com'
    fill_in 'user[password]',with:'foobar'
    fill_in 'user[password_confirmation]',with:'foobal'
    fill_in 'user[profile]',with:'テスト'

    # 新規登録ボタンをクリックする
    click_on '新規登録'
    # 新規登録が失敗することを検証する
    expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
  end
end