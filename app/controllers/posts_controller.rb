class PostsController < ApplicationController
   before_action :set_post, only: [:show, :add_like, :edit, :update]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash[:errors]  = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def add_like
    @post.increment!(:likes, @post.id)
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
