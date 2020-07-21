class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def store_current_location
    store_location_for(:user, request.url)
  end




  private

    # 新規登録する時に名前とコメントとプロフィール画像と背景画像を許可する。
    def configure_permitted_parameters
      
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:profile])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:profile_image])
      devise_parameter_sanitizer.permit(:sign_up, keys:[:profile_bg])

      # アカウント変更時に名前とコメントとプロフィール画像と背景画像を許可する。
      devise_parameter_sanitizer.permit(:account_update, keys:[:name])
      devise_parameter_sanitizer.permit(:account_update, keys:[:email])
      devise_parameter_sanitizer.permit(:account_update, keys:[:profile])
      devise_parameter_sanitizer.permit(:account_update, keys:[:profile_image])
      devise_parameter_sanitizer.permit(:account_update, keys:[:profile_bg])
    end


end
