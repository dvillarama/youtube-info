require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe "GET index" do
    it "has a OK status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "Post create" do
    let(:video_double) { double(Video) }
    before { allow(Video).to receive(:new).and_return(video_double) }

    context "when the video is not found" do
      it "has a redirected status code" do
        expect(video_double).to receive(:valid?).and_return(false)
        get :create
        expect(response.status).to eq(302)
      end
      it "redirected to the videos index" do
        expect(video_double).to receive(:valid?).and_return(false)
        get :create
        expect(response).to redirect_to(videos_url)
      end
    end

    context "when the video is found" do
      it "has a OK status code" do
        expect(video_double).to receive(:valid?).and_return(true)
        get :create
        expect(response.status).to eq(200)
      end
    end
  end
end
