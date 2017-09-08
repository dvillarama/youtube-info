require 'rails_helper'

RSpec.describe Video, type: :model do

  let(:video_id) { 'my video id' }
  let(:yt_video_double) { double(Yt::Video) }
  subject(:video) { Video.new(video_id) }
  before { allow(video).to receive(:create_video).and_return(yt_video_double) }

  describe "#video_id" do
    it "returns the video's id" do
      expect(video.video_id).to eq('my video id')
    end
  end

  describe "#valid?" do
    context "when the video is found" do
      it "is considered valid" do
        allow(yt_video_double).to receive(:invalid?).and_return(false)
        expect(video.valid?).to be_truthy
      end
    end
    context "when the video is not found" do
      it "is considered invalid" do
        allow(yt_video_double).to receive(:invalid?).and_raise(Yt::Errors::NoItems)
        expect(video.valid?).to be_falsey
      end
    end
  end

  describe "#view_count" do
    it "returns the video's view count" do
      allow(yt_video_double).to receive(:view_count).and_return('a lot of views')
      expect(video.view_count).to eq('a lot of views')
    end
  end
end
