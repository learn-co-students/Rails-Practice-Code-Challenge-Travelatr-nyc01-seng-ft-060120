class PostsController < ApplicationController
    def index 
        @posts = Post.all 
    end 

    def show
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new 
    end 

    def create 
    end 

    def edit 
        @post = Post.find(params[:id])
    end 

    def update 
        @post = Post.find(params[:id])
    end 

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 

end
