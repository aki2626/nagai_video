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
    if  @user.update_attributes(user_params)
    else 
      flash.now[:alert] = @user.errors.full_messages
      render :edit and return
    end
    @user_detail = UserDetail.find(params[:id])
    render :edit_user_detail
  end

  def update_user_detail
    @user_detail = UserDetail.find(params[:id])
    if @user_detail.update_attributes(user_detail_params)
    else 
      flash.now[:alert] = @user_detail.errors.full_messages
      render :new_user_detail and return
    end
    @user = User.find(params[:id])
    sign_in(:user, @user)
  end

  protected

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
  def user_detail_params
    params.require(:user_detail).permit(:gender, :prefecture_id, :birth_date, :image)
  end
end
