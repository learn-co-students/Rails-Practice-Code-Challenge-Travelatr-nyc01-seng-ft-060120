class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

end