class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :edit]
    # def index 
    #     @posts = Post.all
    # end

    def show 
    end

    def new 
        @post = Post.new
    end

    def create 
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(:likes => @post.likes + 1)
        redirect_to post_path(@post)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params 
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    
end
