require 'rails_helper'

RSpec.describe "posts", type: :request do
  
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @post = Post.create!(title: "Title One", body: "Body of post one", user: @john)
  end
  
  describe 'GET /posts/:id/edit' do
    context 'with non-signed in user' do
      before { get "/posts/#{@post.id}/edit" }
      
      it "redirects to the signin page" do
        expect(response.status).to eq 302
        flash_message = "You need to sign in or sign up before continuing."
        expect(flash[:alert]).to eq flash_message
      end
    end
    
    context 'with signed in user who is non-owner' do
      before do
        login_as(@fred)
        get "/posts/#{@post.id}/edit"
      end
      
      it "redirects to the home page" do
        expect(response.status).to eq 302 
        flash_message = "You can only edit your own post."
        expect(flash[:alert]).to eq flash_message
      end
    end
    
    context 'with signed in user as owner successful edit' do
      before do
        login_as(@john)
        get "/posts/#{@post.id}/edit"
      end
      
      it "successfully edits post" do
        expect(response.status).to eq 200
      end
    end
  end
  
  describe 'GET /posts/:id' do
    context 'with existing post' do
      before { get "/posts/#{@post.id}" }
      
      it "handles existing post" do
        expect(response.status).to eq 200
      end
    end
    
    context 'with non-existing post' do
      before { get "/posts/xxxx" }
      
      it "handles non-existing post" do
        expect(response.status).to eq 302
        flash_message = "The post you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end