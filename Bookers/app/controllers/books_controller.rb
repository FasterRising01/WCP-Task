class BooksController < ApplicationController

  def index
  	@books = Book.all
    @book = Book.new
  end

  def new
  	@book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def create
  	@book = Book.new(book_params)
    @books = Book.all
  	if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])#ひとつデータを取得
    book.destroy #データ削除
    flash[:notice] = "Book was successfully deleted."
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end

end
