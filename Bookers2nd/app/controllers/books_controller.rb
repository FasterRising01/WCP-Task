class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new 
    @user = User.all
  	@books = Book.all
    @user = current_user
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    @user = current_user
    @books = Book.all
  	if @book.save
       flash[:notice]
  	   redirect_to book_path(@book.id), notice: "You have creatad book successfully."
    else
      render :index
    end
  end

  def show
  	@book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book =Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]
      redirect_to book_path(@book.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
