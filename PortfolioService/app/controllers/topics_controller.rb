class TopicsController < ApplicationController
  before_action :set_sitebar_topics
  layout 'blog'
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:site_admin)
      @posts = @topic.posts.recent.page(params[:page]).per(5)
    else
      @posts = @topic.posts.recent.published.page(params[:page]).per(5)
    end
  end

  private

  def set_sitebar_topics
    @sitebar_topics = Topic.with_published_posts
  end
end
