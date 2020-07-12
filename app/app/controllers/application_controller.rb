class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # ログインした時にマイページへ遷移
  # def after_sign_in_path_for(resource)
  #   user_path(resource)
  # end

  private

    # 新規登録する時に名前とコメントとプロフィール画像と背景画像を許可する。
    def configure_permitted_parameters
      
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
      # devise_parameter_sanitizer.permit(:sign_up, keys:[:profile])
      # devise_parameter_sanitizer.permit(:sign_up, keys:[:profile_image])
      # devise_parameter_sanitizer.permit(:sign_up, keys:[:background_image])

      # アカウント変更時に名前とコメントとプロフィール画像と背景画像を許可する。
      devise_parameter_sanitizer.permit(:account_update, keys:[:name])
      devise_parameter_sanitizer.permit(:account_update, keys:[:email])
      # devise_parameter_sanitizer.permit(:account_update, keys:[:profile])
      # devise_parameter_sanitizer.permit(:account_update, keys:[:profile_image])
      # devise_parameter_sanitizer.permit(:account_update, keys:[:background_image])
    end


end
