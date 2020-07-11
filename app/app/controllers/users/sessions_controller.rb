class Users::SessionsController < Devise::SessionsController

  # ゲストユーザーがいればデータベースから取り出す。いなければ作成する。
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end