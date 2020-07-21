class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[ destroy]

  # ゲストユーザーだったら削除できないように設定する
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

    protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # ユーザー編集後にマイページに遷移
  def after_update_path_for(resource)
    user_path(resource)
  end

end