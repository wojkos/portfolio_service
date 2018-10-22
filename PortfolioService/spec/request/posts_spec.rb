require 'rails_helper'
RSpec.describe "Posts", type: :request do
  before do
    @post = Post.create(title: "Title one", body: "Body of article one")
  end

  describe 'GET /posts/:id' do 
    context 'with existing post' do
      before { get "/posts/#{@post.id}" }

      it "handles existing post" do 
        expect(response.status).to eq 200
      end 
    end

    context 'with non-existing post' do 
      before { get "/posts/xxxxx" }

      it "handles non-existing post" do 
        expect(response.status).to eq 302
        flash_message = "The post you are looking \for could not be found"
        expect(flash[:alert]).to eq flash_message
      end
    end 
  end
end