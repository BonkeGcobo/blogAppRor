class PostsController < ApplicationController

    def index
    end

    def show
        @params = params[:id]
    end
end