class LandingController < ApplicationController
  def index
    @books = Book.all.limit(2).order(created_at: :desc)
    @courses = Course.all
    @tags = Tag.all
  end
end
