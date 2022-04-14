class PostsController < ApplicationController
  def index
  end

  def new
    @posts = Post.new
  end

  def create
    Post.create(content: params[:post][:content])
    redirect_to new_post_path
  end
end
