class MylistsController < ApplicationController
  before_action :set_video

  def create
    @mylist = Mylist.new(mylist_params)
    @mylist.videos << @video
    if @mylist.save
      redirect_to root_path, notice: 'マイリストに追加しました'
    else
      redirect_to  root_path
    end
  end

  private
  def set_video
    binding.pry
    @video = Video.find(params[:video_id])
  end
  def mylist_params
    params.require(:mylist).permit(:name,:explain, video_ids: []).merge(user_id: current_user.id)
  end

end
