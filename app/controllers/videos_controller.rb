class VideosController < ApplicationController
  impressionist :actions=>[:show]
  
  def index
    # @videos = Video.includes(:tags)
    # if @params[:tag_name]
    #   @videos = Video..tagged_with("#{params[:tag_name]}")
    # end
    # if内の内容はtag_withメソッドを使用して受け取った:tag_nameを持つvideoを返すアクションになっています。
    @videos_ranking = Video.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(5).pluck(:impressionable_id))
    @videos_latest = Video.includes(:mylists).limit(5).order('created_at DESC')
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

  def show
    @video = Video.find(params[:id])
    @mylist = Mylist.new
    @user = current_user
    if user_signed_in?
      @mylists = @user.mylists
    end
    new_history = @video.viewing_histories.new
    new_history.user_id = current_user.id
    if current_user.viewing_histories.exists?(video_id: "#{params[:id]}")
      old_history = current_user.viewing_histories.find_by(video_id: "#{params[:id]}")
      old_history.destroy
    end
    new_history.save

  end

  def search
    @videos = Video.search(params[:keyword]).page(params[:page]).per(9)
  end

  private

  def video_params
    params.require(:video).permit(:explain,
                                  :movie,
                                  :title,
                                  :genre_id,
                                  :tag_list).merge(user_id: current_user.id)
  end
end
