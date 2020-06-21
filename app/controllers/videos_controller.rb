class VideosController < ApplicationController
  impressionist :actions=>[:show]
  before_action :login_confirmation, only: %i[new create edit update destroy]
  
  def index
    @videos_ranking = Video.ranking
    @videos_latest = Video.includes([:mylists, :comments]).limit(5).order('created_at DESC')
    if user_signed_in?
      @video_viewing_history = Video.history(current_user)
    end
  end

  def new
    @video = Video.new 
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to root_path, notice: '動画を更新しました。'
    else
      render  :edit
    end
  end

  def show
    @video = Video.find(params[:id])
    @ranking_videos = Video.ranking
    @mylist = Mylist.new
    @comment = Comment.new
    @comments = @video.comments.includes(:user).order('created_at DESC')


    @user = @video.user
    if user_signed_in?
      @mylists = @user.mylists

      new_history = @video.viewing_histories.new
      new_history.user_id = current_user.id
      if current_user.viewing_histories.exists?(video_id: "#{params[:id]}")
        old_history = current_user.viewing_histories.find_by(video_id: "#{params[:id]}")
        old_history.destroy
      end
      new_history.save
      viewing_histories_stock_limit = 10
      histories = current_user.viewing_histories.all
      if  histories.count > viewing_histories_stock_limit
        histories[0].destroy
      end
    end
  end
  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to user_path(current_user)
  end

  def search
    @videos = Video.search(params[:keyword]).includes([:mylists, :comments]).page(params[:page]).per(9)
    @search = params[:keyword]
  end

  def genre 
    @videos = Video.where(genre_id: params[:id]).includes([:mylists, :comments]).page(params[:page]).per(9)
    @genre = Genre.find(params[:id])
  end

  def tag
    @tag = params[:tag_name]
    @videos = Video.tagged_with("#{params[:tag_name]}").includes([:mylists, :comments]).page(params[:page]).per(9)
  end

  def ranking_index
    @videos = Video.ranking_20
  end

  def latest_index
    @videos = Video.includes([:mylists, :comments]).order('created_at DESC').page(params[:page]).per(9)
  end

  private

  def video_params
    params.require(:video).permit(:explain,
                                  :movie,
                                  :title,
                                  :genre_id,
                                  :tag_list).merge(user_id: current_user.id)
  end
  
  def login_confirmation
    unless user_signed_in?
      redirect_to root_path, notice: 'ログインまたは、ユーザー新規登録してください'
    end
  end
end
