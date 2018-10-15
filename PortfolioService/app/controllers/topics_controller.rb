class TopicsController < ApplicationController
  layout 'blog'
  
  def index
    @topics = Topic
  end

  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:site_admin)
      @posts = @topic.posts.recent.page(params[:page]).per(5)
    else
      @posts = @topic.posts.recent.published.page(params[:page]).per(5)
    end
  end
end
