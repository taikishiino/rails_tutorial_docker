class ApplicationController < ActionController::Base
  # before_actionで共通のメソッドを定義できる
  before_action:set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
