class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def user_detail
    @user = User.find_by(id: params[:id])
  end

  def user_create
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save # 保存に成功したらtrue
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      # アクションを実行せずにビューを表示
      render("users/user_create")
      @user.errors.full_messages
    end
  end

  def user_edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save # 保存に成功したらtrue
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      # アクションを実行せずにビューを表示
      # viewのパスを以下に表記
      render("/users/user_edit")
      @user.errors.full_messages
    end
  end
end
