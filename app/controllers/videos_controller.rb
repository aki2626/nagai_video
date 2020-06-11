class VideosController < ApplicationController
  impressionist :actions=>[:show]
  
  def index
    # @videos = Video.includes(:tags)
    # if @params[:tag_name]
    #   @videos = Video..tagged_with("#{params[:tag_name]}")
    # end
    # if内の内容はtag_withメソッドを使用して受け取った:tag_nameを持つvideoを返すアクションになっています。
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
    @mylists = @user.mylists
  end

  def search
    @videos = Video.search(params[:keyword])
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
