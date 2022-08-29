class BooksController < ApplicationController


  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_book, only: %i[show edit update destroy]

  
  def index
    set_meta_tags title: "#{Book.count} books about Ruby & Ruby on Rails", description: "The largest collection of books about Ruby & Ruby on Rails. Find books that will help you learn new versions of Ruby 3, Ruby on Rails 7, Hotwire, TurboFrame, and become a better programmer in general", keywords: 'Book, Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Vue with Rails, React with Rails, Tailwind with Rails, learn ruby, learn ruby on rails'

    #@tags = Tag.where(title: "ha")
    @tags = Tag.all.order(:title)
    @pagy, @books = pagy(Book.all.order(created_at: :desc))
    @featured = Book.where(featured: true).where(free: false)
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
    @more_books = Book.where(id: Book.pluck(:id).sample(3)) 

    @next_book = @book.next
    @previous_book = @book.previous

    set_meta_tags title: "Book #{@book.title}", description: "#{@book.title} by #{@book.authors.map { |author| author.name}.join(", ").html_safe}. #{@book.content}", keywords: "#{@book.tags.map {|tag| tag.title}.join(", ").html_safe}, #{@book.title}, #{@book.authors.map { |author| author.name}.join(", ").html_safe}"
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
    params.require(:book).permit(:title, :subtitle, :cover, :content, :free, :year, :page, :getBookOnAmazonUrl, :getBookOnSiteTitle, :getBookOnSiteUrl, :featured, :isbn, tag_ids: [], author_ids: [])
  end

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end

end
