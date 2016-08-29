class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.attributes = user_params
    if @user.save
      redirect_to login_path,notice: "注册成功，请登录"
    else
      flash[:error] = "用户信息填写有错误"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])

  end


private
  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation,:cache_dir,:avatar_cache,:avatar)
  end

end
