class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.create(post_params)
      if @post.valid?
        redirect_to post_path(@post)
      else
        # Flash brings errors to new page
        flash[:my_errors] = @post.errors.full_messages
        redirect_to new_post_path
      end
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update(:likes => @post.likes+1)

      redirect_to post_path(@post)
    end

    private
    def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end
