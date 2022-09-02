class Books::FreeController < ApplicationController
  def index
    set_meta_tags title: "#{Book.free_books.count} free books about Ruby & Ruby on Rails", description: "Find books that will help you learn new versions of Ruby 3, Ruby on Rails 7, Hotwire, TurboFrame, and become a better programmer in general", keywords: 'Book, free, Ruby, Ruby 3, Ruby on Rails 7, Ruby on Rails 6, Hotwire, Turbo Frame, Stimulus, Vue with Rails, React with Rails, Tailwind with Rails, learn ruby, learn ruby on rails'

    @books = Book.free_books
    @featured = Book.where(featured: true).where(free: true)
    @random_book = Book.where(id: Book.free_books.pluck(:id).sample) 
    @tags = Tag.all.order(:title)
  end

  def show
    @book = Book.free_books.friendly.find(params[:id])

    @random_book = Book.where(id: Book.free_books.pluck(:id).sample) 
    @more_books = Book.free_books.where(id: Book.free_books.pluck(:id).sample(3)) 

    set_meta_tags title: "Free book #{@book.title}", description: "Free book #{@book.title} by #{@book.authors.map { |author| author.name}.join(", ").html_safe}. #{@book.content}", keywords: "#{@book.tags.map {|tag| tag.title}.join(", ").html_safe}, #{@book.title}, free, #{@book.authors.map { |author| author.name}.join(", ").html_safe}"

  end
end
