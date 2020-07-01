class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show, :edit, :update]

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    redirect_to @blogger
  end

  def update
    @blogger = Blogger.update(blogger_params)
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
