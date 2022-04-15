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
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to posts_path, notice: "投稿を作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end

  def show
    @post =  Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end


end
