class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def login_form

  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def user_detail
    @user = User.find_by(id: params[:id])
  end

  def user_create
    @user = User.new
  end
  def create
    @user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        image_name: "default_user.jpg"
    )
    if @user.save # 保存に成功したらtrue
      session[:user_id] = @user.id
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

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      # データを変数に定義
      image = params[:image]
      # ファイルを作成
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

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
