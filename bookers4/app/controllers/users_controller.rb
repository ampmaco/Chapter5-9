class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @book = Book.new
    @profile_image = current_user
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	 redirect_to books_path, notice: "You update successfully."
    else
      render action: :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :plofile, :profile_image)
  end
end
