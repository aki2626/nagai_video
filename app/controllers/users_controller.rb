class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @latest_mylist = @user.mylists.first
  end
end
