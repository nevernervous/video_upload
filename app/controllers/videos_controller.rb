class VideosController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
    @video = Video.new
    @videos = Video.all

  end

  def create
    @video = current_user.videos.build(video_params)

    if @video.save
      flash[:success] = 'Successfully uploaded!'
    else
      flash[:danger] = 'Failed upload!'
    end
    redirect_to video_path
  end

  private
  def video_params
    params.require(:video).permit(:title, :video)
  end

end
