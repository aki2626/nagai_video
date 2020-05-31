class VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new 
  end

  def create
    @video = Video.new(video_params)
    @video.save!
    redirect_to root_path
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:explain,
                                  :movie,
                                  :title,
                                  :genre,
                                  :tag)
  end
end
