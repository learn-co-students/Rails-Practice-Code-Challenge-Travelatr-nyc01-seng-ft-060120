class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show]

    def index 
        @bloggers = Blogger.all
    end

    def show    
    end

    def new 
        @blogger = Blogger.new 
    end

    def create 
        @blogger = Blogger.new(blogger_params)

        if @blogger.valid?
            @blogger.save 
            redirect_to blogger_path(@blogger)
        else 
            puts "Error"
            redirect_to new_blogger_path(@blogger)
        end
    end

    def set_blogger 
        @blogger = Blogger.find(params[:id])
    end


    def blogger_params 
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
