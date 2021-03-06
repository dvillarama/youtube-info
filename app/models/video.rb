require 'yt'

class Video
  attr_accessor :video_id

  def initialize(video_id)
    @video_id = video_id
  end

  def internal_video
    @internal_video ||= create_video
  end

  # allow tests to overwrite this method so that we don't access the real api when running unit tests
  def create_video
    Yt::Video.new(id:(@video_id))
  end

  def valid?
    begin
      # I'm using 'invalid?' but any method should work to check if we found valid video
      !internal_video.invalid?
    rescue Yt::Errors::NoItems
      false
    end
  end

  # delegate a few methods
  def view_count
    internal_video.view_count
  end

  def description
    internal_video.description
  end

  def channel_title
    internal_video.channel_title
  end

  def embed_html
    internal_video.embed_html
  end
end
