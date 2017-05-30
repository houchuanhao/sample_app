class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end
  def new
  	@user=User.new
  end
  def show
  	@user=User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user 
  		#或者 redirect_to user_url(@user)
  	else
  	  render 'new'
  	end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    # 处理更新成功的情况
    else
    render 'edit'
    end
  end
private
  def user_params
	params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 确保是正确的用户
  def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless current_user?(@user)
  end
end
