class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def top
  end

  def index
    @books = Book.all
      @book = Book.new
  end

  def new
    @book = Book.new
  end


  def show
  end

  def edit
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.'
      else
        render :index
      end
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated.'
      else
        render :edit 
      end
  end

  def destroy
    @book.destroy
      redirect_to books_url, notice: 'Item was successfully destroyed.'
  end

  private
  
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
