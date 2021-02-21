class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] ='the post is successfully posted'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'the post is successfully updated'
      redirect_to book_path
    else
      flash[:notice] = 'the error occoured'
      render:new
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = 'destroy was successfully done'
      redirect_to books_path
    else
      flash[:notice] = 'destroy was failed'
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
