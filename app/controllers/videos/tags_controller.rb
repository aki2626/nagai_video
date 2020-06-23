class Videos::TagsController < ApplicationController
  def index
    @video = Video.find(params[:id])
    binding.pry
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
  end
end
