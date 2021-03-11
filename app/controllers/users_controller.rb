class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
