class BooksController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @tags = Tag.all
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @book.update book_params
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :content, :free, :page, :getBookOnAmazonUrl, :getBookOnSiteTitle, 
:getBookOnSiteUrl, :isbn, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
