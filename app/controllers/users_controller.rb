class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @latest_mylist = @user.mylists.first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :edit and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @user_detail = @user.build_user_detail
    render :edit_user_detail
  end

  def update_user_detail
    @user = User.find(session["devise.regist_data"]["user"])
    @user_detail = UserDetail.find(user_detail_params)
    unless @user_detail.valid?
      flash.now[:alert] = @user_detail.errors.full_messages
      render :new_user_detail and return
    end
    @user.build_user_detail(@user_detail.attributes)
    @user.update
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def user_detail_params
    params.require(:user_detail).permit(:gender, :prefecture_id, :birth_date, :image)
  end
end
