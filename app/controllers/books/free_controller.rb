class Books::FreeController < ApplicationController
  def index
    @books = Book.free_books
  end

  def show
    @book = Book.free_books.friendly.find(params[:id])
  end
end
