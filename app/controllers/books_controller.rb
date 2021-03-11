class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @book_new = Book.new #urlのidのデータ
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)#空のデータにbook_paramsが入っている
    @book.user_id = current_user.id
    if @book.save               #@bookに保存している
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
