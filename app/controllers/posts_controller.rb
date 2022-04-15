class PostsController < ApplicationController
 
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.create(post_params)
    if @posts.save
      redirect_to posts_path, notice: "投稿を作成しました！"
    else
      render :new
    end
  end

  def show
    @posts =  Post.find(params[:id])
  end

  def edit 
    @posts =  Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
