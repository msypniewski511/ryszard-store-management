class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #handle successful save.
      flash[:success] = "Witaj w sklepie!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
