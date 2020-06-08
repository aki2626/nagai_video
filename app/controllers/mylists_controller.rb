class MylistsController < ApplicationController
  def new
  end

  def create
    @mylist = Mylist.new(mylist_params)
    if @mylist.save
      redirect_to root_path, notice: 'マイリストに追加しました'
    else
      render  root_path
    end
  end

  private
  def mylist_params
    params.require(:mylist).permit(video_ids: [])
  end

end
