class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :toggle_status]
  before_action :set_sitebar_topics, except: [:update, :create, :destroy, :toggle_status]
  layout 'blog'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all, message: 'You shall not pass'

  def index
    if logged_in?(:site_admin)
      @posts = Post.recent.page(params[:page]).per(5)
    else
      @posts = Post.recent.published.page(params[:page]).per(5)
    end
    @page_title = 'My blog | Wojciech Kostański'
  end

  def show
    @post = Post.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @page_title = @post.title
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end

    redirect_to blog_path, notice: 'Post status has been updated.'
  end

  protected
    def resource_not_found
      message ='Post could not be found'
      redirect_to blog_path, notice: message
    end
  
  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def set_sitebar_topics
      @sitebar_topics = Topic.with_published_posts
    end

    def post_params
      params.require(:post).permit(:title,
                                  :body,
                                  :topic_id,
                                  :status
                                  )
    end
end
