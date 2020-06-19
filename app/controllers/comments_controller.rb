class CommentsController < ApplicationController
  before_action :login_confirmation
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      @comments = @video.comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to video_path(@video)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  unless user_signed_in?
    redirect_to root_path, notice: 'ログインまたは、ユーザー新規登録してください'
  end
end
