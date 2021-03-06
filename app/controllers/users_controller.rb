class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user,   only: [:show]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find_by_sql("SELECT 'posts'.* FROM 'posts' WHERE team = '#{@user[:team]}'")
  end

  def new
  end

  def create
    @user = User.new(user_params)
     if @user.save
      log_in user
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :team, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
