class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 
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
  end

  def edit 
  end

  def update
    if @posts.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @posts.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @posts = Post.find(params[:id])
  end


end
