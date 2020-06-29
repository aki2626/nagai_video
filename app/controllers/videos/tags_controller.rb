class Videos::TagsController < ApplicationController
  def index
    @video = Video.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def edit
  end 
  def update
  end
  def destroy
    binding.pry
    tagging = Tagging.find(params[:id])
    video = Video.find(tagging.taggable_id)
    tagging.destroy
    redirect_to video_path(video)
  end
end
