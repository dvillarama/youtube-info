class VideosController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def create
    @video = Video.new params['id']

    unless @video.valid?
      flash[:notice] = "Sorry I could not find that video.  Try Again."
      redirect_to videos_url
    end
  end
end
