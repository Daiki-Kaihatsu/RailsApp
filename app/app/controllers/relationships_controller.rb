class RelationshipsController < ApplicationController

  def index
    @users = User.find params[:follow_id]
  end

  def create
    @user = User.find params[:follow_id]
    following = current_user.follow(@user)
    if following.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find params[:follow_id]
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to users_path
    end
  end


end
