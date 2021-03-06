class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
  end
end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have creatad book successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error prohibited this obj from being saved"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end