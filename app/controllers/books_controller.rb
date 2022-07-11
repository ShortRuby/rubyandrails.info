class BooksController < ApplicationController

  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_book, only: %i[show edit update destroy]

  def index
    #@tags = Tag.where(title: "ha")
    @tags = Tag.all.order(:title)
    @books = Book.all
    #@books = Book.joins(:tags).where(tags: { title: "ha" })
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
    @book = Book.friendly.find(params[:id])
    @next_book = @book.next
    @previous_book = @book.previous
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

  def by_year
    #@books = Book.joins(:tags).where(tags: { title: "ha" })
    #@book = Book.friendly.where(year: params[:year])
    @books = Book.friendly.find_by(year: params[:year])
  end
  
  private

  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :subtitle, :content, :free, :year, :page, :getBookOnAmazonUrl, :getBookOnSiteTitle, :getBookOnSiteUrl, :isbn, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
