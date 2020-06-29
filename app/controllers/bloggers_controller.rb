class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show]
  
  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    redirect_to @blogger
  end


  private
  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end
end
