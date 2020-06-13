class MylistsController < ApplicationController
  # before_action :set_video

  def index
    @mylist = Mylist.find(params[:mylist_id])
  end
  
  def show
    @user = current_user
    @mylist = Mylist.find(params[:id])
  end

  def create
    @video = Video.find(params[:video_id])
    @mylist = Mylist.new(mylist_params)
    @mylist.videos << @video
    binding.pry
    if @mylist.save!
      redirect_to root_path, notice: 'マイリストに追加しました'
    else
      redirect_to  root_path
    end
  end

  def add
    @video = Video.find(params[:id])
    @mylist = Mylist.find(params[:video_id])
    # ここのparamsのidは中間テーブルの関係でidとvideoが入れ替わるため。
    @mylist.videos << @video
    if @mylist.save!
      redirect_to root_path, notice: '動画をマイリストに追加しました'
    else
      redirect_to  root_path
    end
  end

  private
  # def set_video
  #   binding.pry
  #   @video = Video.find(params[:video_id])
  # end
  def mylist_params
    params.require(:mylist).permit(:name,:explain, video_ids: []).merge(user_id: current_user.id)
  end

end
