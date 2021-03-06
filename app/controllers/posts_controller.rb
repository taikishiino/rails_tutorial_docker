class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 詳細画面
  def post_detail
    @post = Post.find_by(id: params[:id])
  end

  # 投稿画面
  def post_create
  end

  # post保存処理
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts")
  end

  # 編集画面
  def post_edit
    @post = Post.find_by(id: params[:id])
  end
  # 編集処理
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts")
  end

  # 削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts")
  end
end
